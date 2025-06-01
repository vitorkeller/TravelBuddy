var express = require('express');
var router = express.Router();

/* GET Pages. */
router.get('/', function (req, res, next) {
    if (global.usuarioEmail && global.usuarioEmail != '') { res.redirect('/Dashboard'); }
    res.render('admin/Login', { title: 'TravelBuddy - Login' });
});

router.get('/Dashboard', function (req, res, next) {
    verificarLoginMySQL(res);
    res.render('admin/Dashboard', { admNome: global.admNome });
});

router.get('/Categorias', async function (req, res, next) {
    verificarLoginMySQL(res);
    const categorias = await global.banco.adminBuscarCategorias();
    res.render('admin/Categorias', { admNome: global.admNome, categorias, mensagem: null, sucesso: false });
});

router.get('/ExcluirCategoria/:id', async function (req, res, next) {
    verificarLoginMySQL(res);
    const catCodigo = req.params.id;
    const categorias = await global.banco.adminBuscarCategoriaPorCodigo(catCodigo);
    if (!categorias) {
        return res.render('admin/categorias', { admNome: global.admNome, categorias: await global.banco.adminBuscarCategorias(), mensagem: 'Categoria não encontrada.', sucesso: false });
    }
    await global.banco.adminExcluirCategoria(catCodigo);
    return res.render('admin/categorias', { admNome: global.admNome, categorias: await global.banco.adminBuscarCategorias(), mensagem: "Categoria excluída com sucesso.", sucesso: true });
});

router.get('/NovaCategoria', function (req, res, next) {
    verificarLoginMySQL(res);
    res.render('admin/CategoriasNovo', { admNome: global.admNome, mensagem: null, sucesso: false });
});

router.get('/AtualizarCategoria/:id', async function (req, res, next) {
    verificarLoginMySQL(res);
    const catCodigo = parseInt(req.params.id);
    const categorias = await global.banco.adminBuscarCategoriaPorCodigo(catCodigo);
    if (!categorias) {
        return res.render('admin/CategoriasAtualizar', { admNome: global.admNome, mensagem: 'Categoria não encontrada.', sucesso: false });
    }
    res.render('admin/CategoriasAtualizar', { admNome: global.admNome, categorias, mensagem: null, sucesso: false });
});

router.get('/Usuarios', async function (req, res, next) {
    verificarLoginMySQL(res);
    const usuarios = await global.banco.adminBuscarUsuarios();
    res.render('admin/Usuarios', { admNome: global.admNome, usuarios, mensagem: null, sucesso: false });
});

router.get('/ExcluirUsuario/:id', async function (req, res, next) {
    verificarLoginMySQL(res);
    const usuCodigo = req.params.id;
    const usuario = await global.banco.adminBuscarUsuarioPorCodigo(usuCodigo);
    if (!usuario) {
        return res.render('admin/Usuarios', { admNome: global.admNome, usuarios: await global.banco.adminBuscarUsuarios(), mensagem: 'Usuário não encontrado.', sucesso: false });
    }
    await global.banco.adminExcluirUsuario(usuCodigo);
    return res.render('admin/Usuarios', { admNome: global.admNome, usuarios: await global.banco.adminBuscarUsuarios(), mensagem: "Usuário excluído com sucesso.", sucesso: true });
});

router.get('/NovoUsuario', function (req, res, next) {
    verificarLoginMySQL(res);
    res.render('admin/UsuarioNovo', { admNome: global.admNome, mensagem: null, sucesso: false });
});

router.get('/Locais', function (req, res, next) {
    verificarLoginMySQL(res);
    res.render('admin/Locais', { admNome: global.admNome });
});

router.get('/Configuracoes', function (req, res, next) {
    verificarLoginMySQL(res);
    res.render('admin/Configuracoes', { admNome: global.admNome });
});

router.get('/Sair', function (req, res, next) {
    delete global.admCodigo;
    delete global.admEmail;
    delete global.admSenha;
    res.redirect('/admin');
});

/* POST Pages. */
router.post('/Login', async function (req, res, next) {
    const { email, senha } = req.body;
    const admin = await global.banco.buscarAdmin({ email, senha });
    if (admin.admCodigo) {
        global.admCodigo = admin.admCodigo;
        global.admEmail = admin.admEmail;
        global.admNome = admin.admNome;
        res.redirect('/admin/Dashboard',);
    }
    else {
        res.redirect('/admin');
    }
});

router.post('/NovaCategoria', async function (req, res, next) {
    verificarLoginMySQL(res);
    const { catNome, catNomeNormal } = req.body;
    if (!catNome || !catNomeNormal) {
        return res.render('admin/CategoriasNovo', { admNome: global.admNome, mensagem: "Preencha todos os campos!", sucesso: false });
    }
    const categoriaJaExiste = await global.banco.adminBuscarCategoria(catNome);
    if (categoriaJaExiste) {
        return res.render('admin/CategoriasNovo', { admNome: global.admNome, mensagem: "Essa categoria já existe!", sucesso: false });
    }
    await global.banco.adminInserirCategoria(catNome, catNomeNormal);
    return res.render('admin/CategoriasNovo', { admNome: global.admNome, mensagem: "Categoria cadastrada com sucesso!", sucesso: true });
});

router.post('/AtualizarCategoria/:id', async function (req, res, next) {
    verificarLoginMySQL(res);
    const catCodigo = req.params.id;
    const { catNome, catNomeNormal } = req.body;
    if (!catNome || !catNomeNormal) {
        return res.render('admin/CategoriasAtualizar', { admNome: global.admNome, categorias: { catCodigo, catNome, catNomeNormal }, mensagem: "Preencha todos os campos!", sucesso: false });
    }
    const categoriaExiste = await global.banco.adminBuscarCategoria(catNome);
    if (categoriaExiste) {
        return res.render('admin/CategoriasAtualizar', { admNome: global.admNome, categorias: { catCodigo, catNome, catNomeNormal }, mensagem: "Categoria já existe.", sucesso: false });
    }
    await global.banco.adminAtualizarCategoria(catCodigo, catNome, catNomeNormal);
    return res.render('admin/CategoriasAtualizar', { admNome: global.admNome, categorias: { catCodigo, catNome, catNomeNormal }, mensagem: "Categoria atualizada com sucesso.", sucesso: true });
});

router.post('/NovoUsuario', async function (req, res, next) {
    verificarLoginMySQL(res);
    const { usuNome, usuEmail, usuSenha } = req.body;
    if (!usuNome || !usuEmail || !usuSenha) {
        return res.render('admin/UsuarioNovo', { admNome: global.admNome, mensagem: "Preencha todos os campos!", sucesso: false });
    }
    const usuarioJaExiste = await global.banco.adminBuscarUsuarioPorEmail(usuEmail);
    if (usuarioJaExiste) {
        return res.render('admin/UsuarioNovo', { admNome: global.admNome, mensagem: "Esse usuário já existe!", sucesso: false });
    }
    await global.banco.adminInserirUsuario(usuNome, usuEmail, usuSenha);
    return res.render('admin/UsuarioNovo', { admNome: global.admNome, mensagem: "Usuário cadastrado com sucesso!", sucesso: true });
});

/* FUNCTIONS */
function verificarLoginMySQL(res) {
    if (!global.admEmail || global.admEmail == '') res.redirect('/admin');
};

module.exports = router;

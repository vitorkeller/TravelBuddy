var express = require('express');
var router = express.Router();
const multer = require('multer');
const path = require('path');
const fs = require('fs');

const dirPublicacoes = path.join(__dirname, '../public/Uploads/Publicações');
if (!fs.existsSync(dirPublicacoes)) {
    fs.mkdirSync(dirPublicacoes, { recursive: true });
}

const storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, 'public/uploads/Publicações');
    },
    filename: function (req, file, cb) {
        if (req.body && req.body.pubFotoAntiga) {
            cb(null, req.body.pubFotoAntiga);
        } else {
            cb(null, file.originalname);
        }
    }
});
const upload = multer({ storage: storage });

/* GET Pages. */
router.get('/', function (req, res, next) {
    if (global.usuarioEmail && global.usuarioEmail != '') { res.redirect('/Dashboard'); }
    res.render('admin/Login', { title: 'TravelBuddy - Login' });
});

router.get('/Dashboard', function (req, res, next) {
    verificarLoginMySQL(res);
    res.render('admin/Dashboard', { admNome: global.admNome, paginaAtual: '/admin/Dashboard' });
});

router.get('/Categorias', async function (req, res, next) {
    verificarLoginMySQL(res);
    const categorias = await global.banco.adminBuscarCategorias();
    res.render('admin/Categorias', { admNome: global.admNome, categorias, mensagem: null, sucesso: false, paginaAtual: '/admin/Categorias' });
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
    res.render('admin/Usuarios', { admNome: global.admNome, usuarios, mensagem: null, sucesso: false, paginaAtual: '/admin/Usuarios' });
});

router.get('/ExcluirUsuario/:id', async function (req, res, next) {
    verificarLoginMySQL(res);
    const usuCodigo = req.params.id;
    const usuario = await global.banco.adminBuscarUsuarioPorCodigo(usuCodigo);
    if (!usuario) {
        return res.render('admin/Usuarios', {
            admNome: global.admNome,
            usuarios: await global.banco.adminBuscarUsuarios(),
            mensagem: 'Usuário não encontrado.',
            sucesso: false
        });
    }
    const publicacoes = await global.banco.adminBuscarPublicacoes();
    for (const pub of publicacoes) {
        if (pub.usuCodigo == usuCodigo && pub.pubFoto) {
            const imgPath = path.join(__dirname, '../public/uploads/Publicações', pub.pubFoto);
            console.log('Tentando apagar:', imgPath);
            if (fs.existsSync(imgPath)) {
                try { fs.unlinkSync(imgPath); console.log('Arquivo removido:', imgPath); } catch (e) { }
            }
        }
    }
    if (
        usuario.usuFoto &&
        usuario.usuFoto !== 'imgPerfilPadrao.png' &&
        usuario.usuFoto !== 'imgPerfilPadrão.png'
    ) {
        const imgPerfilPath = path.join(__dirname, '../public/uploads/Perfil', usuario.usuFoto);
        console.log('Tentando apagar imagem de perfil:', imgPerfilPath);
        if (fs.existsSync(imgPerfilPath)) {
            try { fs.unlinkSync(imgPerfilPath); console.log('Arquivo removido:', imgPerfilPath); } catch (e) { }
        }
    }
    await global.banco.adminExcluirUsuario(usuCodigo);
    return res.render('admin/Usuarios', {
        admNome: global.admNome,
        usuarios: await global.banco.adminBuscarUsuarios(),
        mensagem: "Usuário excluído com sucesso.",
        sucesso: true
    });
});

router.get('/NovoUsuario', function (req, res, next) {
    verificarLoginMySQL(res);
    res.render('admin/UsuarioNovo', { admNome: global.admNome, mensagem: null, sucesso: false });
});

router.get('/AtualizarUsuario/:id', async function (req, res, next) {
    verificarLoginMySQL(res);
    const usuCodigo = parseInt(req.params.id);
    const usuario = await global.banco.adminBuscarUsuarioPorCodigo(usuCodigo);
    if (!usuario) {
        return res.render('admin/UsuarioAtualizar', { admNome: global.admNome, mensagem: 'Usuário não encontrado.', sucesso: false });
    }
    res.render('admin/UsuarioAtualizar', { admNome: global.admNome, usuario, mensagem: null, sucesso: false });
});

router.get('/Locais', async function (req, res, next) {
    verificarLoginMySQL(res);
    const paises = await global.banco.adminBuscarPaises();
    res.render('admin/Locais', { admNome: global.admNome, paises, paginaAtual: '/admin/Locais' });
});

router.get('/Publicacoes', async function (req, res, next) {
    verificarLoginMySQL(res);
    const publicacoes = await global.banco.adminBuscarPublicacoes();
    res.render('admin/Publicacoes', { admNome: global.admNome, publicacoes, mensagem: null, sucesso: false, paginaAtual: '/admin/Publicacoes' });
});

router.get('/ExcluirPublicacao/:id', async function (req, res, next) {
    verificarLoginMySQL(res);
    const pubCodigo = req.params.id;
    const publicacao = await global.banco.adminBuscarPublicacaoPorCodigo(pubCodigo);
    if (!publicacao) {
        return res.render('admin/Publicacoes', {
            admNome: global.admNome,
            publicacoes: await global.banco.adminBuscarPublicacoes(),
            mensagem: 'Publicação não encontrada.',
            sucesso: false
        });
    }
    await global.banco.adminExcluirPublicacao(pubCodigo);
    return res.render('admin/Publicacoes', {
        admNome: global.admNome,
        publicacoes: await global.banco.adminBuscarPublicacoes(),
        mensagem: "Publicação excluída com sucesso.",
        sucesso: true
    });
});

router.get('/AtualizarPublicacao/:id', async function (req, res, next) {
    verificarLoginMySQL(res);
    const pubCodigo = req.params.id;
    const publicacao = await global.banco.adminBuscarPublicacaoPorCodigo(pubCodigo);
    const categorias = await global.banco.adminBuscarCategorias();
    const paises = await global.banco.buscarPaises();
    if (!publicacao) {
        return res.render('admin/Publicacoes', { mensagem: 'Publicação não encontrada.', sucesso: false });
    }
    res.render('admin/PublicacoesAtualizar', { publicacao, categorias, paises, mensagem: null, sucesso: false });
});

router.get('/Sair', function (req, res, next) {
    delete global.admCodigo;
    delete global.admEmail;
    delete global.admSenha;
    delete global.admNome;
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

router.post('/AtualizarUsuario/:id', async function (req, res, next) {
    verificarLoginMySQL(res);
    const usuCodigo = req.params.id;
    const { usuNome, usuEmail, usuSenha } = req.body;
    if (!usuNome || !usuEmail || !usuSenha) {
        return res.render('admin/UsuarioAtualizar', { admNome: global.admNome, usuario: { usuCodigo, usuNome, usuEmail, usuSenha }, mensagem: "Preencha todos os campos!", sucesso: false });
    }
    await global.banco.adminAtualizarUsuario(usuCodigo, usuNome, usuEmail, usuSenha);
    return res.render('admin/UsuarioAtualizar', { admNome: global.admNome, usuario: { usuCodigo, usuNome, usuEmail, usuSenha }, mensagem: "Usuário atualizado com sucesso.", sucesso: true });
});

router.post('/AtualizarPublicacao/:id', upload.single('pubFoto'), async function (req, res, next) {
    verificarLoginMySQL(res);
    const pubCodigo = req.params.id;
    const { pubTitulo, pubDescricao, paisCodigo, usuCodigo } = req.body;
    let categorias = req.body.categorias;
    let pubFoto = req.body.pubFotoAntiga;
    if (req.file && req.file.originalname) {
        const imgPath = path.join(__dirname, '../public/uploads/Publicações', pubFoto);
        if (fs.existsSync(imgPath)) {
            try { fs.unlinkSync(imgPath); } catch (e) { }
        }
        const novoPath = path.join(__dirname, '../public/uploads/Publicações', pubFoto);
        fs.renameSync(req.file.path, novoPath);
    }
    if (!pubTitulo || !pubDescricao || !paisCodigo || !categorias) {
        const publicacao = await global.banco.adminBuscarPublicacaoPorCodigo(pubCodigo);
        const todasCategorias = await global.banco.adminBuscarCategorias();
        const paises = await global.banco.buscarPaises();
        return res.render('admin/PublicacoesAtualizar', {
            publicacao, categorias: todasCategorias, paises,
            mensagem: "Preencha todos os campos!", sucesso: false
        });
    }
    await global.banco.adminAtualizarPublicacao(pubCodigo, pubTitulo, pubDescricao, pubFoto, paisCodigo, categorias);
    const publicacao = await global.banco.adminBuscarPublicacaoPorCodigo(pubCodigo);
    const todasCategorias = await global.banco.adminBuscarCategorias();
    const paises = await global.banco.buscarPaises();
    res.render('admin/PublicacoesAtualizar', {
        publicacao, categorias: todasCategorias, paises,
        mensagem: "Publicação atualizada com sucesso.", sucesso: true
    });
});

/* FUNCTIONS */
function verificarLoginMySQL(res) {
    if (!global.admEmail || global.admEmail == '') return res.redirect('/admin');
};

module.exports = router;

var express = require('express');
var router = express.Router();
const multer = require('multer');
const path = require('path');
const fs = require('fs');

const dirPublicacoes = path.join(__dirname, '../public/Uploads/Publicações');
if (!fs.existsSync(dirPublicacoes)) {
    fs.mkdirSync(dirPublicacoes, { recursive: true });
}

const storagePerfil = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, 'public/Uploads/Perfil');
    },
    filename: function (req, file, cb) {
        const ext = path.extname(file.originalname);
        const nomeArquivo = `perfil_${global.usuarioCodigo}_${Date.now()}${ext}`;
        cb(null, nomeArquivo);
    }
});
const uploadPerfil = multer({ storage: storagePerfil });

const storagePublicacao = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, 'public/Uploads/Publicações');
    },
    filename: function (req, file, cb) {
        const ext = path.extname(file.originalname);
        const nomeArquivo = `publicacao_${global.usuarioCodigo}_${Date.now()}${ext}`;
        cb(null, nomeArquivo);
    }
});
const uploadPublicacao = multer({ storage: storagePublicacao });

/* GET Pages. */
router.get('/', function (req, res, next) {
    if (global.usuarioEmail && global.usuarioEmail != '') { res.redirect('/Inicial'); }
    res.render('Login', { title: 'TravelBuddy - Login' });
});

router.get('/Cadastro', function (req, res, next) {
    res.render('Cadastro');
});

router.get('/EsqueceuSenha', function (req, res, next) {
    res.render('EsqueceuSenha', { mensagem: null, sucesso: null });
});

router.get('/Inicial', async function (req, res, next) {
    verificarLoginMySQL(res);
    const categorias = await global.banco.buscarCategorias();
    let categoriasSelecionadas = [];
    if (req.query.categorias) {
        if (Array.isArray(req.query.categorias)) {
            categoriasSelecionadas = req.query.categorias;
        } else {
            categoriasSelecionadas = req.query.categorias.split(',').filter(cat => cat.trim() !== '');
        }
    }
    let publicacoes;
    if (categoriasSelecionadas.length > 0) {
        publicacoes = await global.banco.buscarPublicacoesPorCategorias(categoriasSelecionadas);
    } else {
        publicacoes = await global.banco.buscarPublicacoes();
    }
    res.render('Inicial', {
        titulo: 'TravelBuddy',
        imagem: global.usuarioFoto,
        categorias,
        publicacoes,
        categoriasSelecionadas
    });
});

router.get('/api/publicacoes', async function (req, res, next) {
    try {
        let categoriasSelecionadas = [];
        if (req.query.categorias) {
            if (Array.isArray(req.query.categorias)) {
                categoriasSelecionadas = req.query.categorias;
            } else {
                categoriasSelecionadas = req.query.categorias.split(',').filter(cat => cat.trim() !== '');
            }
        }
        let publicacoes;
        if (categoriasSelecionadas.length > 0) {
            publicacoes = await global.banco.buscarPublicacoesPorCategorias(categoriasSelecionadas);
        } else {
            publicacoes = await global.banco.buscarPublicacoes();
        }
        res.json({ publicacoes });
    } catch (error) {
        console.error('Erro ao buscar publicações:', error);
        res.status(500).json({ erro: 'Erro ao buscar publicações' });
    }
});

router.get('/Privacidade', function (req, res, next) {
    verificarLoginMySQL(res);
    res.render('Privacidade', { titulo: 'TravelBuddy', imagem: global.usuarioFoto });
});

router.get('/Termos', function (req, res, next) {
    verificarLoginMySQL(res);
    res.render('Termos', { titulo: 'TravelBuddy', imagem: global.usuarioFoto });
});

router.get('/PublicarFotografia', async function (req, res, next) {
    verificarLoginMySQL(res);
    const paises = await global.banco.buscarPaises();
    const categorias = await global.banco.buscarCategorias();
    res.render('PublicarFotografia', { titulo: 'TravelBuddy', imagem: global.usuarioFoto, categorias, paises });
});

router.get('/Imagem/:id', async function (req, res) {
    verificarLoginMySQL(res);
    const pubCodigo = req.params.id;
    const publicacao = await global.banco.buscarPublicacaoPorId(pubCodigo);
    if (!publicacao) {
        return res.status(404).render('404', { mensagem: 'Publicação não encontrada.' });
    }
    res.render('Imagem', { titulo: 'TravelBuddy', imagem: global.usuarioFoto, publicacao });
});

router.get('/Curtidas', function (req, res, next) {
    verificarLoginMySQL(res);
    res.render('Curtidas', { titulo: 'TravelBuddy', imagem: global.usuarioFoto });
});

router.get('/Perfil', async function (req, res, next) {
    verificarLoginMySQL(res);
    const perInteresse = await global.banco.buscarInteresses(global.usuarioCodigo);
    const perDescricao = await global.banco.buscarDescricao(global.usuarioCodigo);
    const perLocalizacao = await global.banco.buscarLocalizacao(global.usuarioCodigo);
    const publicacao = await global.banco.buscarPublicacaoPorUsuario(global.usuarioCodigo);
    res.render('Perfil', {
        titulo: 'TravelBuddy', imagem: global.usuarioFoto, nome: global.usuarioNome, localizacao: perLocalizacao, interesses: perInteresse, descricao: perDescricao, publicacao
    });
});

router.get('/EditarPerfil', async function (req, res, next) {
    verificarLoginMySQL(res);
    const perInteresse = await global.banco.buscarInteresses(global.usuarioCodigo);
    const perDescricao = await global.banco.buscarDescricao(global.usuarioCodigo);
    const perLocalizacao = await global.banco.buscarLocalizacao(global.usuarioCodigo);
    const paises = await global.banco.buscarPaises();
    res.render('EditarPerfil', { titulo: 'TravelBuddy', imagem: global.usuarioFoto, nome: global.usuarioNome, localizacao: perLocalizacao, interesses: perInteresse, descricao: perDescricao, paises });
});

router.get('/sair', function (req, res, next) {
    delete global.usuarioCodigo;
    delete global.usuarioEmail;
    delete global.usuarioSenha;
    res.redirect('/');
});

/* POST Pages. */
router.post('/Login', async function (req, res, next) {
    const email = req.body.email;
    const senha = req.body.senha;
    const usuario = await global.banco.buscarUsuario({ email, senha });
    if (usuario.usuCodigo) {
        global.usuarioCodigo = usuario.usuCodigo;
        global.usuarioEmail = usuario.usuEmail;
        global.usuarioFoto = usuario.usuFoto;
        global.usuarioNome = usuario.usuNome;
        res.redirect('/Inicial');
    } else { res.redirect('/'); }
});

router.post('/EsqueceuSenha', async function (req, res) {
    const { usuEmail, novaSenha } = req.body;
    const usuario = await global.banco.buscarUsuarioPorEmail({ email: usuEmail });
    if (!usuario || !usuario.usuCodigo) {
        return res.render('EsqueceuSenha', { mensagem: 'E-mail não encontrado.', sucesso: false });
    }
    await global.banco.atualizarSenhaUsuario(usuEmail, novaSenha);
    res.render('EsqueceuSenha', { mensagem: 'Senha alterada com sucesso!', sucesso: true });
});

router.post('/Cadastro', async function (req, res, next) {
    const nome = req.body.nome;
    const email = req.body.email;
    const senha = req.body.senha;
    const usuario = { nome, email, senha };
    const usuarioExistente = await global.banco.buscarUsuarioPorEmail({ email });
    if (usuarioExistente && usuarioExistente.usuCodigo) {
        res.render('Cadastro', { erro: 'Usuário já cadastrado!' });
    } else {
        await global.banco.cadastrarUsuario(usuario);
        res.redirect('/');
    }
});

router.post('/EditarPerfil', uploadPerfil.single('foto'), async function (req, res) {
    verificarLoginMySQL(res);
    try {
        const usuCodigo = global.usuarioCodigo;
        const perDescricao = await global.banco.buscarDescricao(usuCodigo);
        let novaFoto = global.usuarioFoto;
        if (req.file) {
            if (
                global.usuarioFoto &&
                global.usuarioFoto !== 'imgPerfilPadrao.png' &&
                global.usuarioFoto !== 'imgPerfilPadrão.png'
            ) {
                const caminhoImagemAntiga = path.join(__dirname, '../public/Uploads/Perfil', global.usuarioFoto);
                if (fs.existsSync(caminhoImagemAntiga)) {
                    try { fs.unlinkSync(caminhoImagemAntiga); } catch (err) { }
                }
            }
            const ext = path.extname(req.file.originalname);
            novaFoto = `perfil_${usuCodigo}${ext}`;
            const novoPath = path.join(__dirname, '../public/Uploads/Perfil', novaFoto);
            fs.renameSync(req.file.path, novoPath);
        }
        let interesses = req.body.interesses;
        if (!Array.isArray(interesses) && interesses) interesses = [interesses];
        if (interesses && interesses.length > 3) interesses = interesses.slice(0, 3);
        interesses = interesses ? interesses.join(',') : '';
        const dados = {
            nome: req.body.nome && req.body.nome.trim() !== '' ? req.body.nome.trim() : global.usuarioNome, foto: novaFoto, localizacao: req.body.localizacao || '', interesses: interesses, descricao: req.body.descricao && req.body.descricao.trim() !== '' ? req.body.descricao.trim() : perDescricao
        };
        await global.banco.atualizarPerfil(usuCodigo, dados);
        global.usuarioNome = dados.nome;
        global.usuarioFoto = dados.foto;
        res.redirect('/Perfil');
    } catch (error) {
        console.error('Erro ao atualizar perfil:', error);
        res.status(500).send('Erro ao atualizar perfil.');
    }
});

router.post('/PublicarFotografia', uploadPublicacao.single('pubFoto'), async function (req, res) {
    verificarLoginMySQL(res);
    try {
        if (!req.file) {
            return res.status(400).send('A foto é obrigatória.');
        }
        const usuCodigo = global.usuarioCodigo;
        const numero = await global.banco.proximoNumeroPublicacao(usuCodigo);
        const ext = path.extname(req.file.originalname);
        const nomeArquivo = `publicacao_${usuCodigo}_${numero}${ext}`;
        const novoPath = path.join(__dirname, '../public/Uploads/Publicações', nomeArquivo);
        fs.renameSync(req.file.path, novoPath);
        const pubTitulo = req.body.pubTitulo;
        const pubDescricao = req.body.pubDescricao;
        const pubData = req.body.pubData;
        const pubFoto = nomeArquivo;
        const paisCodigo = req.body.paisCodigo;
        let categorias = req.body.categorias;
        if (!Array.isArray(categorias) && categorias) categorias = [categorias];
        if (!pubTitulo || !pubDescricao || !pubData || !pubFoto || !paisCodigo || !categorias || categorias.length === 0) {
            return res.status(400).send('Todos os campos são obrigatórios.');
        }
        if (categorias.length > 3) {
            return res.status(400).send('Selecione no máximo 3 categorias.');
        }
        const pubCodigo = await global.banco.publicarFotografia({ pubTitulo, pubDescricao, pubData, pubFoto, paisCodigo, usuCodigo });
        for (const catCodigo of categorias) {
            await global.banco.vincularCategoriaPublicacao(pubCodigo, catCodigo);
        }
        res.redirect('/Perfil');
    } catch (error) {
        console.error('Erro ao publicar fotografia:', error);
        res.status(500).send('Erro ao publicar fotografia.');
    }
});

/* FUNCTIONS */
function verificarLoginMySQL(res) {
    if (!global.usuarioEmail || global.usuarioEmail == '') res.redirect('/');
};

module.exports = router;

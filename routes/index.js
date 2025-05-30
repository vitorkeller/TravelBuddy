var express = require('express');
var router = express.Router();
const multer = require('multer');
const path = require('path');
const fs = require('fs');

const storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, 'public/uploads');
    },
    filename: function (req, file, cb) {
        const ext = path.extname(file.originalname);
        const nomeArquivo = `perfil_${global.usuarioCodigo}_${Date.now()}${ext}`;
        cb(null, nomeArquivo);
    }
});
const upload = multer({ storage: storage });

/* GET Pages. */
router.get('/', function (req, res, next) {
    if (global.usuarioEmail && global.usuarioEmail != '') { res.redirect('/Inicial'); }
    res.render('Login', { title: 'TravelBuddy - Login' });
});

router.get('/Cadastro', function (req, res, next) {
    res.render('Cadastro');
});

router.get('/Inicial', async function (req, res, next) {
    verificarLoginMySQL(res);
    const categorias = await global.banco.adminBuscarCategorias();
    res.render('Inicial', { titulo: 'TravelBuddy', imagem: global.usuarioFoto, categorias });
});

router.get('/Privacidade', function (req, res, next) {
    verificarLoginMySQL(res);
    res.render('Privacidade', { titulo: 'TravelBuddy', imagem: global.usuarioFoto });
});

router.get('/Termos', function (req, res, next) {
    verificarLoginMySQL(res);
    res.render('Termos', { titulo: 'TravelBuddy', imagem: global.usuarioFoto });
});

router.get('/Imagem', function (req, res, next) {
    verificarLoginMySQL(res);
    res.render('Imagem', { titulo: 'TravelBuddy', imagem: global.usuarioFoto });
});

router.get('/PublicarFotografia', function (req, res, next) {
    verificarLoginMySQL(res);
    res.render('PublicarFotografia', { titulo: 'TravelBuddy', imagem: global.usuarioFoto });
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
    res.render('Perfil', {
        titulo: 'TravelBuddy',
        imagem: global.usuarioFoto,
        nome: global.usuarioNome,
        localizacao: perLocalizacao,
        interesses: perInteresse,
        descricao: perDescricao
    });
});

router.get('/EditarPerfil', async function (req, res, next) {
    verificarLoginMySQL(res);
    // Busque os dados do perfil do usuário
    const perInteresse = await global.banco.buscarInteresses(global.usuarioCodigo);
    const perDescricao = await global.banco.buscarDescricao(global.usuarioCodigo);
    const perLocalizacao = await global.banco.buscarLocalizacao(global.usuarioCodigo);

    res.render('EditarPerfil', {
        titulo: 'TravelBuddy',
        imagem: global.usuarioFoto,
        nome: global.usuarioNome,
        localizacao: perLocalizacao,
        interesses: perInteresse,
        descricao: perDescricao
    });
});

router.get('/PostagemImagem', async function (req, res, next) {
    verificarLoginMySQL(res);
    const categorias = await global.banco.adminBuscarCategorias();
    res.render('PostagemImagem', { titulo: 'TravelBuddy', imagem: global.usuarioFoto, categorias });
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

router.post('/EditarPerfil', upload.single('foto'), async function (req, res) {
    verificarLoginMySQL(res);
    try {
        const usuCodigo = global.usuarioCodigo;
        const perInteresse = await global.banco.buscarInteresses(usuCodigo);
        const perDescricao = await global.banco.buscarDescricao(usuCodigo);
        const perLocalizacao = await global.banco.buscarLocalizacao(usuCodigo);
        let novaFoto = global.usuarioFoto;
        if (req.file) {
            novaFoto = req.file.filename;

            const caminhoImagemAntiga = path.join(__dirname, '../public/uploads', global.usuarioFoto);

            console.log('Tentando excluir imagem:', caminhoImagemAntiga);

            if (global.usuarioFoto !== 'imgPerfilPadrao.png' && fs.existsSync(caminhoImagemAntiga)) {
                try {
                    fs.unlinkSync(caminhoImagemAntiga);
                    console.log('Imagem antiga excluída com sucesso');
                } catch (err) {
                    console.error('Erro ao excluir imagem antiga:', err);
                }
            }
        }
        const dados = {
            nome: req.body.nome && req.body.nome.trim() !== '' ? req.body.nome.trim() : global.usuarioNome,
            foto: req.file ? req.file.filename : global.usuarioFoto,
            localizacao: req.body.localizacao && req.body.localizacao.trim() !== '' ? req.body.localizacao.trim() : perLocalizacao,
            interesses: req.body.interesses && req.body.interesses.trim() !== '' ? req.body.interesses.trim() : perInteresse,
            descricao: req.body.descricao && req.body.descricao.trim() !== '' ? req.body.descricao.trim() : perDescricao
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

/* FUNCTIONS */
function verificarLoginMySQL(res) {
    if (!global.usuarioEmail || global.usuarioEmail == '') res.redirect('/');
};

module.exports = router;

const mysql = require("mysql2/promise");

async function conectarBD() {
    if (global.conexao && global.conexao.state !== "disconnected") {
        return global.conexao;
    }
    const conexao = await mysql.createConnection({
        host: "localhost",
        port: 3306,
        user: "root",
        password: "",
        database: "travelbuddy"
    });
    global.conexao = conexao;
    return global.conexao;
};

async function buscarUsuario(usuario) {
    const conexao = await conectarBD();
    const sql = "SELECT * FROM usuarios WHERE usuEmail = ? and usuSenha = ?;";
    const [usuarioEncontrado] = await conexao.query(sql, [usuario.email, usuario.senha]);
    return usuarioEncontrado && usuarioEncontrado.length > 0 ? usuarioEncontrado[0] : {};
}

async function buscarUsuarioPorEmail(usuario) {
    const conexao = await conectarBD();
    const sql = "SELECT * FROM usuarios WHERE usuEmail = ?";
    const [resultado] = await conexao.query(sql, [usuario.email]);
    return resultado && resultado.length > 0 ? resultado[0] : {};
}

async function cadastrarUsuario(usuario) {
    const conexao = await conectarBD();
    const sql = "INSERT INTO usuarios (usuEmail, usuSenha, usuNome) VALUES (?, ?, ?)";
    await conexao.query(sql, [usuario.email, usuario.senha, usuario.nome]);
}

async function buscarInteresses(usuCodigo) {
    const conexao = await conectarBD();
    const sql = "SELECT perInteresses FROM perfis WHERE usuCodigo=?;";
    const [interesses] = await conexao.query(sql, [usuCodigo]);
    return interesses && interesses.length > 0 ? interesses[0].perInteresses : "";
}

async function buscarDescricao(usuCodigo) {
    const conexao = await conectarBD();
    const sql = "SELECT perDescricao FROM perfis WHERE usuCodigo=?;";
    const [descricao] = await conexao.query(sql, [usuCodigo]);
    return descricao && descricao.length > 0 ? descricao[0].perDescricao : "";
}

async function buscarLocalizacao(usuCodigo) {
    const conexao = await conectarBD();
    const sql = "SELECT perLocalizacao FROM perfis WHERE usuCodigo=?;";
    const [localizacao] = await conexao.query(sql, [usuCodigo]);
    return localizacao && localizacao.length > 0 ? localizacao[0].perLocalizacao : "";
}

async function buscarPerfilCompleto(usuCodigo) {
    const conexao = await conectarBD();
    const sql = "SELECT * FROM perfis WHERE usuCodigo=?;";
    const [resultado] = await conexao.query(sql, [usuCodigo]);
    return resultado && resultado.length > 0 ? resultado[0] : {};
}

async function atualizarUsuarioNome(usuCodigo, nome) {
    const conexao = await conectarBD();
    const sql = "UPDATE usuarios SET usuNome=? WHERE usuCodigo=?;";
    await conexao.query(sql, [nome, usuCodigo]);
}

async function atualizarFoto(usuCodigo, foto) {
    const conexao = await conectarBD();
    const sql = "UPDATE usuarios SET usuFoto=? WHERE usuCodigo=?;";
    await conexao.query(sql, [foto, usuCodigo]);
}

async function atualizarPerfilSomente(usuCodigo, localizacao, interesses, descricao) {
    const conexao = await conectarBD();
    const sql = "UPDATE perfis SET perLocalizacao=?, perInteresses=?, perDescricao=? WHERE usuCodigo=?;";
    await conexao.query(sql, [localizacao, interesses, descricao, usuCodigo]);
}

async function atualizarPerfil(usuCodigo, dados) {
    if (!dados || typeof dados !== 'object') {
        throw new Error('Parâmetro "dados" inválido na função atualizarPerfil');
    }
    const conexao = await conectarBD();
    const sqlUsuario = "UPDATE usuarios SET usuNome=?, usuFoto=? WHERE usuCodigo=?;";
    await conexao.query(sqlUsuario, [dados.nome, dados.foto, usuCodigo]);
    const sqlPerfil = "UPDATE perfis SET perLocalizacao=?, perInteresses=?, perDescricao=? WHERE usuCodigo=?;";
    await conexao.query(sqlPerfil, [dados.localizacao, dados.interesses, dados.descricao, usuCodigo]);
}

async function buscarAdmin(admin) {
    const conexao = await conectarBD();
    const sql = "SELECT * FROM admins WHERE admEmail=? AND admSenha=?;";
    const [adminEncontrado] = await conexao.query(sql, [admin.email, admin.senha]);
    return adminEncontrado && adminEncontrado.length > 0 ? adminEncontrado[0] : {};
}

async function adminBuscarCategorias() {
    const conexao = await conectarBD();
    const sql = "SELECT * FROM categorias ORDER BY catCodigo;";
    const [categorias] = await conexao.query(sql);
    return categorias;
}

async function adminBuscarCategoria(catNome) {
    const conexao = await conectarBD();
    const sql = "SELECT * FROM categorias WHERE catNome=?;";
    const [categoria] = await conexao.query(sql, [catNome]);
    return categoria && categoria.length > 0 ? categoria[0] : null;
}

async function adminBuscarCategoriaPorCodigo(catCodigo) {
    const conexao = await conectarBD();
    const sql = "SELECT * FROM categorias WHERE catCodigo=?;";
    const [categorias] = await conexao.query(sql, [catCodigo]);
    return categorias[0] || null;
}

async function adminExcluirCategoria(catCodigo) {
    const conexao = await conectarBD();
    const sql = "DELETE FROM categorias WHERE catCodigo=?;";
    await conexao.query(sql, [catCodigo]);
}

async function adminInserirCategoria(catNome, catNomeNormal) {
    const conexao = await conectarBD();
    const sql = "INSERT INTO categorias (catNome, catNomeNormal) VALUES (?, ?);";
    await conexao.query(sql, [catNome, catNomeNormal]);
}

async function adminAtualizarCategoria(catCodigo, catNome, catNomeNormal) {
    const conexao = await conectarBD();
    const sql = "UPDATE categorias SET catNome=?, catNomeNormal=? WHERE catCodigo=?;";
    await conexao.query(sql, [catNome, catNomeNormal, catCodigo]);
}

async function adminBuscarUsuarios() {
    const conexao = await conectarBD();
    const sql = "SELECT * FROM usuarios ORDER BY usuCodigo;";
    const [usuarios] = await conexao.query(sql);
    return usuarios;
}

async function adminBuscarUsuarioPorCodigo(usuCodigo) {
    const conexao = await conectarBD();
    const sql = "SELECT * FROM usuarios WHERE usuCodigo=?;";
    const [usuarios] = await conexao.query(sql, [usuCodigo]);
    return usuarios[0] || null;
}

async function adminExcluirUsuario(usuCodigo) {
    const conexao = await conectarBD();
    const sql = "DELETE FROM usuarios WHERE usuCodigo=?;";
    await conexao.query(sql, [usuCodigo]);
}

async function adminBuscarUsuarioPorEmail(usuEmail) {
    const conexao = await conectarBD();
    const sql = "SELECT * FROM usuarios WHERE usuEmail=?;";
    const [usuarios] = await conexao.query(sql, [usuEmail]);
    return usuarios && usuarios.length > 0 ? usuarios[0] : null;
}

async function adminInserirUsuario(usuNome, usuEmail, usuSenha) {
    const coexao = await conectarBD();
    const sql = "INSERT INTO usuarios (usuNome, usuEmail, usuSenha) VALUES (?, ?, ?);";
    await coexao.query(sql, [usuNome, usuEmail, usuSenha]);
}

async function adminAtualizarUsuario(usuCodigo, usuNome, usuEmail, usuSenha) {
    const conexao = await conectarBD();
    const sql = "UPDATE usuarios SET usuNome=?, usuEmail=?, usuSenha=? WHERE usuCodigo=?;";
    await conexao.query(sql, [usuNome, usuEmail, usuSenha, usuCodigo]);
}

conectarBD();

module.exports = { buscarUsuario, buscarUsuarioPorEmail, cadastrarUsuario, buscarInteresses, buscarDescricao, buscarLocalizacao, buscarPerfilCompleto, atualizarUsuarioNome, atualizarFoto, atualizarPerfilSomente, atualizarPerfil, buscarAdmin, adminBuscarCategorias, adminBuscarCategoria, adminBuscarCategoriaPorCodigo, adminExcluirCategoria, adminInserirCategoria, adminAtualizarCategoria, adminBuscarUsuarios, adminBuscarUsuarioPorCodigo, adminExcluirUsuario, adminBuscarUsuarioPorEmail, adminInserirUsuario, adminAtualizarUsuario };

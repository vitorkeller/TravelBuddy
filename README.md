<h1 align="center"> TRAVELBUDDY </h1>
<h2 align="center"> TravelBuddy é uma plataforma web ainda em desenvolvimento como parte da nota final, para a matéria de Server-Side </h2>

<div align="center">
<img src="https://img.shields.io/badge/Express%20js-000000?style=for-the-badge&logo=express&logoColor=white">
<img src="https://img.shields.io/badge/JavaScript-323330?style=for-the-badge&logo=javascript&logoColor=F7DF1E">
<img src="https://img.shields.io/badge/npm-CB3837?style=for-the-badge&logo=npm&logoColor=white">
<img src="https://img.shields.io/badge/Node%20js-339933?style=for-the-badge&logo=nodedotjs&logoColor=white">
</div>

### Estrutura do Projeto
```
TravelBuddy/
├── database/
│   ├── TravelBuddy.sql
├── public/
│   ├── images/
│   ├── javascripts/
│   ├── uploads/
│   ├──├── Perfil/
│   ├──├── Publicação/
├── routes/
│   ├── admin.js
│   └── index.js
├── views/
│   ├── admin/
│   ├── componentes/
│   └── ...
├── .gitignore
├── app.js
├── banco.js
├── LICENSE
├── package-lock.json
├── package.json
└── README.md
```

## Pré-requisitos & Instalação

### Pré-requisitos

- [Node.js](https://nodejs.org/) (v16+ recomendado)
- [npm](https://www.npmjs.com/)
- [MySQL](https://www.mysql.com/)

### Instalação

1. **Clone o repositório:**
   ```sh
   git clone https://github.com/vitorkeller/travelbuddy.git
   ```
   ```sh
   cd travelbuddy
   ```

2. **Instale as dependências:**
   ```sh
   npm install
   ```

3. **Configure o banco de dados:**
   - Crie um banco MySQL chamado `travelbuddy`.
   - Ajuste as configurações de conexão em `banco.js` se necessário.

4. **Importando o banco de dados**
    - O script para criar as tabelas e dados iniciais está em `database/travelbuddy.sql`.
    - Para importar no MySQL, use:
    
    ```sh
    mysql -u root travelbuddy < database/travelbuddy.sql
    ```

5. **Inicie o projeto:**
   ```sh
   npm start
   ```

6. **Acesse no navegador:**  
   [http://localhost:3000](http://localhost:3000)
   - **Para acessar como usuário comum:**  
     E-mail: `usuario@gmail.com`  
     Senha: `usuario`

   [http://localhost:3000/admin](http://localhost:3000/admin)  
   - **Para acessar o painel admin:**  
     E-mail: `admin@gmail.com`  
     Senha: `admin`

## Criadores

- [Vitor Arthur Keller](https://github.com/vitorkeller)
- [Lucas Camilo Moraes](https://github.com/hub-Moraes)

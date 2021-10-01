const express = require('express');
const session = require('express-session');
const controllers = require('./controllers');
const db = require('./models');
const app = express();
const PORT = process.env.PORT || 3000;
const path = require('path');
const home = require('./routes/home')
const crypto = require('crypto');

//Body Parser
app.use(session({ secret: 'f43df4fgfh65gh6h54g6f6ff6hj54654g' }));
app.use(express.urlencoded({ extended: true }));
app.use(express.json());

app.engine('html', require('ejs').renderFile);
app.set('view engine', 'html');
app.set('views', path.join(__dirname + '/views'));
app.use(express.static(__dirname + '/public'));

var sess;

app.use('/api', controllers.Cidades);
app.use('/api', controllers.Cupoms);
app.use('/api', controllers.Estacaos);
app.use('/api', controllers.EstoqueProds);
app.use('/api', controllers.EstoqueRecs);
app.use('/api', controllers.Funcionarios);
app.use('/api', controllers.Produtos);
app.use('/api', controllers.Reciclados);
app.use('/api', controllers.Reciclagems);
app.use('/api', controllers.Usuarios);
app.use('/', home)

app.post('/', (req, res) => {
  db.Usuario.findOne({ where: { email: req.body.logEmail } }).then(function (user) {
    if (user) {
      req.body.logPass = crypto.createHmac('sha256', req.body.logPass)
        .update('Palmeiras nao tem mundial')
        .digest('hex');

      if (req.body.logPass == user.pass) {
        sess = req.session;
        sess.nome = user.nome;
        sess.userId = user.id;
        sess.ponto = user.pontuacao;
        console.log("Senha Bate")
        res.render('logado', { nome: user.nome, userId: sess.userId, ponto: sess.ponto })
      } else {
        console.log("Email e/ou senha invalidos")
        res.render('index');
      }
    } else {
      console.log("Email e/ou senha invalidos")
      res.render('index');
    }
  })
})


db.sequelize.sync().then(() => {
  app.listen(PORT, () => {
    console.log("Listening on: http://localhost:" + PORT);
  });
});

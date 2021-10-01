const express = require("express");
const router = express.Router();
const db = require('../models');

var sess;

router.get('/', (req, res) => {
    if (req.session.login) {
        res.render("logado")
    } else {
        res.render("index")
    }
})


router.get('/ganhe', (req, res) => {
    db.Produto.findAll({ limit: 10 }).then(function (produtos) {
        res.render("ganhePontos", { produtos: produtos })
    })
})

router.get('/troque', (req, res) => {
    db.Produto.findAll({ limit: 10 }).then(function (produtos) {
        res.render("troquePontos", { produtos: produtos })
    })
})

router.get('/duvidas', (req, res) => {
    res.render("duvidas")
})

router.get('/lojas', (req, res) => {
    db.Estacao.findAll({ limit: 5 }).then(function (estacaos) {
        res.render("lojas", { estacaos: estacaos })
    })
})

router.get('/logado', (req, res) => {
    if (req.session) {
        sess = req.session;
        sess.nome = req.session.nome;
        sess.userId = req.session.id;
        sess.ponto = req.session.pontuacao;
        res.render("logado", { nome: sess.nome, userId: req.session.id, ponto: sess.ponto })
    }

})

router.get('/resgateProdutos', (req, res) => {
    sess = req.session;
    sess.nome = req.session.nome;
    sess.userId = req.session.id;
    sess.ponto = req.session.pontuacao;
    db.Produto.findAll({ limit: 7 }).then(function (produtos) {
        res.render("resgateProdutos", { produtos: produtos, nome: sess.nome, userId: sess.userId, ponto: sess.ponto })
    })

})

router.get('/reciclar', (req, res) => {
    sess = req.session;
    sess.nome = req.session.nome;
    sess.userId = req.session.id;
    sess.ponto = req.session.pontuacao;
    db.Reciclado.findAll({ limit: 7 }).then(function (reciclados) {
        res.render("reciclar", { reciclados: reciclados, nome: sess.nome, userId: sess.userId, ponto: sess.ponto })
    })

})

router.get('/extrato', (req, res) => {
    sess = req.session;
    sess.nome = req.session.nome;
    db.Cupom.findAll({ limit: 15 }).then(function (cupoms) {
        db.Reciclagem.findAll({limit: 15}).then(function (reciclagems) {
            res.render("extrato", {cupoms: cupoms, reciclagems: reciclagems,nome: sess.nome})
        })
    })
})

router.get('/sair', (req, res) => {
    req.session.destroy((err) => {
        if (err) {
            return console.log(err);
        }
        res.redirect('/');
    });

});

module.exports = router;
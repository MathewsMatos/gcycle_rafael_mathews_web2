const express = require("express");
const router = express.Router();
const db = require('../models');

var sess;

router.get("/reciclagems/all", (req, res) => {
    db.Reciclagem.findAll().then(reciclagems => res.send(reciclagems));
});

// get single by id
router.get('/reciclagems/find/:id', (req, res) => {
    db.Reciclagem.findAll({
        where: {
            id: req.params.id
        }
    }).then(reciclagems => res.send(reciclagems));
})

router.post("/reciclagems/new", (req, res) => {
    sess = req.session;
    db.Reciclagem.create({
        UsuarioId: req.body.UsuarioId,
        EstacaoId: 1,
        FuncionarioId: 1,
        RecicladoId: req.body.RecicladoId,
        qtdPonto: req.body.qtdPonto,
        qtdReciclado: req.body.qtdReciclado,
        EstoqueRecId: 1
    }).then(() => res.render("logado", { nome: sess.nome, userId: sess.userId, ponto: sess.ponto }));
});

// delete by id
router.delete('/reciclagems/delete/:id', (req, res) => {
    db.Reciclagem.destroy({
        where: { id: req.params.id }
    }).then(() => res.render("logado"));
})

// edit values
router.put('/reciclagems/edit', (req, res) => {
    db.Reciclagem.update({
        UsuarioId: req.body.UsuarioId,
        EstacaoId: req.body.EstacaoId,
        FuncionarioId: req.body.FuncionarioId,
        RecicladoId: req.body.RecicladoId,
        qtdPonto: req.body.qtdPonto,
        qtdReciclado: req.body.qtdReciclado
    }, {
        where: { id: req.body.id }
    }).then(() => res.render("logado"));
})

module.exports = router;
const express = require("express");
const router = express.Router();
const db = require('../models');

router.get("/produtos/all", (req, res) => {
    db.Produto.findAll().then(produtos => res.send(produtos));
});

// get single by id
router.get('/produtos/find/:id', (req, res) => {
    db.Produto.findAll({
        where: {
            id: req.params.id
        }
    }).then(produtos => res.send(produtos));
})

router.post("/produtos/new", (req, res) => {
    db.Produto.create({
        nome: req.body.nome,
        pontuacao: req.body.pontuacao,
        descricao: req.body.descricao
    }).then(submitedProduto => res.send(submitedProduto));
});

// delete by id
router.delete('/produtos/delete/:id', (req, res) => {
    db.Produto.destroy({
        where: { id: req.params.id }
    }).then(() => res.send('success'));
})

// edit values
router.put('/produtos/edit', (req, res) => {
    db.Produto.update({
        nome: req.body.nome,
        pontuacao: req.body.pontuacao,
        descricao: req.body.descricao
    }, {
        where: { id: req.body.id }
    }).then(() => res.send('success'));
})

module.exports = router;
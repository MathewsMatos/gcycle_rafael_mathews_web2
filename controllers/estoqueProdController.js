const express = require("express");
const router = express.Router();
const db = require('../models');

router.get("/estoqueprods/all", (req, res) => {
    db.EstoqueProd.findAll().then(estoqueprods => res.send(estoqueprods));
});

// get single by id
router.get('/estoqueprods/find/:id', (req, res) => {
    db.EstoqueProd.findAll({
        where: {
            id: req.params.id
        }
    }).then(estoqueprods => res.send(estoqueprods));
})

router.post("/estoqueprods/new", (req, res) => {
    db.EstoqueProd.create({
        ProdutoId: req.body.ProdutoId,
        EstacaoId: req.body.EstacaoId,
        qtdProd: req.body.qtdProd // automatico 0
    }).then(submitedEstoqueProd => res.send(submitedEstoqueProd));
});

// delete by id
router.delete('/estoqueprods/delete/:id', (req, res) => {
    db.EstoqueProd.destroy({
        where: { id: req.params.id }
    }).then(() => res.send('success'));
})

// edit values
router.put('/estoqueprods/edit', (req, res) => {
    db.EstoqueProd.update({
        ProdutoId: req.body.ProdutoId,
        EstacaoId: req.body.EstacaoId,
        qtdProd: req.body.qtdProd
    }, {
        where: { id: req.body.id }
    }).then(() => res.send('success'));
})

module.exports = router;
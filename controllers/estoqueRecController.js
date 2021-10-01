const express = require("express");
const router = express.Router();
const db = require('../models');

router.get("/estoquerecs/all", (req, res) => {
    db.EstoqueRec.findAll().then(estoquerecs => res.send(estoquerecs));
});

// get single by id
router.get('/estoquerecs/find/:id', (req, res) => {
    db.EstoqueRec.findAll({
        where: {
            id: req.params.id
        }
    }).then(estoquerecs => res.send(estoquerecs));
})

router.post("/estoquerecs/new", (req, res) => {
    db.EstoqueRec.create({
        RecicladoId: req.body.RecicladoId,
        EstacaoId: req.body.EstacaoId,
        qtdRec: req.body.qtdRec // automatico 0
    }).then(submitedEstoqueRec => res.send(submitedEstoqueRec));
});

// delete by id
router.delete('/estoquerecs/delete/:id', (req, res) => {
    db.EstoqueRec.destroy({
        where: { id: req.params.id }
    }).then(() => res.send('success'));
})

// edit values
router.put('/estoquerecs/edit', (req, res) => {
    db.EstoqueRec.update({
        RecicladoId: req.body.RecicladoId,
        EstacaoId: req.body.EstacaoId,
        qtdRec: req.body.qtdRec
    }, {
        where: { id: req.body.id }
    }).then(() => res.send('success'));
})

module.exports = router;
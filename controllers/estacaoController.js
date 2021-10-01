const express = require("express");
const router = express.Router();
const db = require('../models');

router.get("/estacaos/all", (req, res) => {
    db.Estacao.findAll().then(estacaos => res.send(estacaos));
});

// get single by id
router.get('/estacaos/find/:id', (req, res) => {
    db.Estacao.findAll({
        where: {
            id: req.params.id
        }
    }).then(estacaos => res.send(estacaos));
})

router.post("/estacaos/new", (req, res) => {
    db.Estacao.create({
        nome: req.body.nome,
        endereco: req.body.endereco,
        CidadeId: req.body.CidadeId
    }).then(submitedEstacao => res.send(submitedEstacao));
});

// delete by id
router.delete('/estacaos/delete/:id', (req, res) => {
    db.Estacao.destroy({
        where: { id: req.params.id }
    }).then(() => res.send('success'));
})

// edit values
router.put('/estacaos/edit', (req, res) => {
    db.Estacao.update({
        nome: req.body.nome,
        endereco: req.body.endereco,
        CidadeId: req.body.CidadeId
    }, {
        where: { id: req.body.id }
    }).then(() => res.send('success'));
})

module.exports = router;
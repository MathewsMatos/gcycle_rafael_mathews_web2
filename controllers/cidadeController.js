const express = require("express");
const router = express.Router();
const db = require('../models');

// get all values
router.get("/cidades/all", (req, res) => {
    db.Cidade.findAll().then(cidades => res.send(cidades));
});

// get single by id
router.get('/cidades/find/:id', (req, res) => {
    db.Cidade.findAll({
        where: {
            id: req.params.id
        }
    }).then(cidades => res.send(cidades));
});

// post new value
router.post("/cidades/new", (req, res) => {
    db.Cidade.create({
        nome: req.body.nome,
        estado: req.body.estado
    }).then(submitedCidade => res.send(submitedCidade));
});

// edit values
router.put('/cidades/edit', (req, res) => {
    db.Cidade.update({
        nome: req.body.nome,
        estado: req.body.estado
    }, {
        where: { id: req.body.id }
    }).then(() => res.send('success'));
});

// delete by id
router.delete('/cidades/delete/:id', (req, res) => {
    db.Cidade.destroy({
        where: { id: req.params.id }
    }).then(() => res.send('success'));
});

module.exports = router;
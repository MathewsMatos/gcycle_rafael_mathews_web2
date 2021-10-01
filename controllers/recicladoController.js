const express = require("express");
const router = express.Router();
const db = require('../models');

router.get("/reciclados/all", (req, res) => {
    db.Reciclado.findAll().then(reciclados => res.send(reciclados));
});

// get single by id
router.get('/reciclados/find/:id', (req, res) => {
    db.Reciclado.findAll({
        where: {
            id: req.params.id
        }
    }).then(reciclados => res.send(reciclados));
})

router.post("/reciclados/new", (req, res) => {
    db.Reciclado.create({
        nome: req.body.nome,
        tipo: req.body.tipo,
        ponto: req.body.ponto,
        unidade: req.body.unidade
    }).then(submitedReciclado => res.send(submitedReciclado));
});

// delete by id
router.delete('/reciclados/delete/:id', (req, res) => {
    db.Reciclado.destroy({
        where: { id: req.params.id }
    }).then(() => res.send('success'));
})

// edit values
router.put('/reciclados/edit', (req, res) => {
    db.Reciclado.update({
        nome: req.body.nome,
        tipo: req.body.tipo,
        ponto: req.body.ponto,
        unidade: req.body.unidade
    }, {
        where: { id: req.body.id }
    }).then(() => res.send('success'));
})

module.exports = router;
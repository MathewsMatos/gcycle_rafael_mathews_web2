const express = require("express");
const router = express.Router();
const db = require('../models');

// get all values
router.get("/usuarios/all", (req, res) => {
    db.Usuario.findAll().then(usuarios => res.send(usuarios));
});

// get single by id
router.get('/usuarios/find/:id', (req, res) => {
    db.Usuario.findAll({
        where: {
            id: req.params.id
        }
    }).then(usuarios => res.send(usuarios));
});

// post new value
router.post("/usuarios/new", (req, res) => {
    db.Usuario.create({
        nome: req.body.nome,
        endereco: req.body.endereco,
        email: req.body.email, // jwt
        pass: req.body.pass, // jwt // automatico ao criar => 0
    }).then(submitedUsuario => res.send(submitedUsuario));
});

// edit values
router.put('/usuarios/edit', (req, res) => {
    db.Usuario.update({
        nome: req.body.nome,
        endereco: req.body.endereco,
        email: req.body.email, // jwt
        pass: req.body.pass, // jwt
        pontuacao: req.body.pontuacao, // usar triggers para alterações
    }, {
        where: { id: req.body.id }
    }).then(() => res.send('success'));
});

// delete by id
router.delete('/usuarios/delete/:id', (req, res) => {
    db.Usuario.destroy({
        where: { id: req.params.id }
    }).then(() => res.send('success'));
});

module.exports = router;
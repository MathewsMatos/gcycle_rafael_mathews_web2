const express = require("express");
const router = express.Router();
const db = require('../models');

// get all values
router.get("/funcionarios/all", (req, res) => {
    db.Funcionario.findAll().then(funcionarios => res.send(funcionarios));
});

// get single by id
router.get('/funcionarios/find/:id', (req, res) => {
    db.Funcionario.findAll({
        where: {
            id: req.params.id
        }
    }).then(funcionarios => res.send(funcionarios));
});

// post new value
router.post("/funcionarios/new", (req, res) => {
    db.Funcionario.create({
        nome: req.body.nome,
        endereco: req.body.endereco,
        email: req.body.email, // jwt
        pass: req.body.pass, // jwt
        fone: req.body.fone,
        EstacaoId: req.body.EstacaoId,
    }).then(submitedFuncionario => res.send(submitedFuncionario));
});

// edit values
router.put('/funcionarios/edit', (req, res) => {
    db.Funcionario.update({
        nome: req.body.nome,
        endereco: req.body.endereco,
        email: req.body.email, // jwt
        pass: req.body.pass, // jwt
        fone: req.body.fone, // usar triggers para alterações
        EstacaoId: req.body.EstacaoId,
    }, {
        where: { id: req.body.id }
    }).then(() => res.send('success'));
});

// delete by id
router.delete('/funcionarios/delete/:id', (req, res) => {
    db.Funcionario.destroy({
        where: { id: req.params.id }
    }).then(() => res.send('success'));
});

module.exports = router;
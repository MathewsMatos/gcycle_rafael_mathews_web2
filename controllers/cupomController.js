const express = require("express");
const router = express.Router();
const db = require('../models');

router.get("/cupoms/all", (req, res) => {
    db.Cupom.findAll().then(cupoms => res.send(cupoms));
});

// get single by id
router.get('/cupoms/find/:id', (req, res) => {
    db.Cupom.findAll({
        where: {
            id: req.params.id
        }
    }).then(cupoms => res.send(cupoms));
})

router.post("/cupoms/new", (req, res) => {
    db.Cupom.create({
        ProdutoId: req.body.ProdutoId,
        UsuarioId: req.body.UsuarioId,
        custo: req.body.custo,
        codigo: req.body.codigo
    }).then(submitedCupom => res.send(submitedCupom));
});

// delete by id
router.delete('/cupoms/delete/:id', (req, res) => {
    db.Cupom.destroy({
        where: { id: req.params.id }
    }).then(() => res.send('success'));
})

// edit values
router.put('/cupoms/edit', (req, res) => {
    db.Cupom.update({
        ProdutoId: req.body.ProdutoId,
        UsuarioId: req.body.UsuarioId,
        codigo: req.body.codigo
    }, {
        where: { id: req.body.id }
    }).then(() => res.send('success'));
})

module.exports = router;
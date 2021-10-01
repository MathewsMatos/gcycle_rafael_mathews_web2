const cidadeController = require('./cidadeController');
const cupomController = require('./cupomController');
const estacaoController = require('./estacaoController');
const estoqueProdController = require('./estoqueProdController');
const estoqueRecController = require('./estoqueRecController');
const funcionarioController = require('./funcionarioController');
const produtoController = require('./produtoController');
const recicladoController = require('./recicladoController');
const reciclagemController = require('./reciclagemController');
const usuarioController = require('./usuarioController');

module.exports = {
    Cidades: cidadeController,
    Cupoms: cupomController,
    Estacaos: estacaoController,
    EstoqueProds: estoqueProdController,
    EstoqueRecs: estoqueRecController,
    Funcionarios: funcionarioController,
    Produtos: produtoController,
    Reciclados: recicladoController,
    Reciclagems: reciclagemController,
    Usuarios: usuarioController,
};
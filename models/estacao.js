module.exports = (sequelize, DataTypes) => {
    const Estacao = sequelize.define('Estacao', {
        nome: DataTypes.STRING,
        endereco: DataTypes.STRING,
    });

    Estacao.associate = (models) => {

        Estacao.belongsToMany(models.Funcionario, {
            through: 'funcionarios',
            as: 'esta_func',
            foreignKey: 'esta_func',
            onDelete: "CASCADE"
        });

        Estacao.belongsToMany(models.EstoqueProd, {
            through: 'estoqueprods',
            as: 'est_etqp',
            foreignKey: 'est_etqp',
            onDelete: "CASCADE"
        });

        Estacao.belongsToMany(models.EstoqueRec, {
            through: 'estoquerecs',
            as: 'est_etqr',
            foreignKey: 'est_etqr',
            onDelete: "CASCADE"
        });

        Estacao.belongsTo(models.Cidade);
    };

    return Estacao;
}
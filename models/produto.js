module.exports = (sequelize, DataTypes) => {
    const Produto = sequelize.define('Produto', {
        nome: DataTypes.STRING,
        pontuacao: DataTypes.INTEGER,
        descricao: DataTypes.STRING,
    });


    Produto.associate = (models) => {

        Produto.belongsToMany(models.Cupom, {
            through: 'cupoms',
            as: 'cup_prod',
            foreignKey: 'cup_prod',
            onDelete: "CASCADE"
        });

        Produto.belongsToMany(models.EstoqueProd, {
            through: 'estoqueprods',
            as: 'prod_etqp',
            foreignKey: 'prod_etqp',
            onDelete: "CASCADE"
        });

    };

    return Produto;
}
module.exports = (sequelize, DataTypes) => {
    const EstoqueProd = sequelize.define('EstoqueProd', {
        qtdProd: DataTypes.INTEGER,
    });

    

    EstoqueProd.associate = (models) => {

        EstoqueProd.belongsTo(models.Estacao, {
            onDelete: "CASCADE"
        });

        EstoqueProd.belongsTo(models.Produto, {
            onDelete: "CASCADE"
        });

    };

    return EstoqueProd;
}
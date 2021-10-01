module.exports = (sequelize, DataTypes) => {
    const EstoqueRec = sequelize.define('EstoqueRec', {
        qtdRec: DataTypes.INTEGER,
    });


    EstoqueRec.associate = (models) => {

        EstoqueRec.belongsTo(models.Reciclado);        
        EstoqueRec.belongsTo(models.Estacao, {
            onDelete: "CASCADE"
        });
        EstoqueRec.belongsToMany(models.Reciclagem, {
            through: 'reciclagems',
            as: 'etq_rec',
            foreignKey: 'etq_rec',
            onDelete: "CASCADE"
        });

    };

    return EstoqueRec;
}
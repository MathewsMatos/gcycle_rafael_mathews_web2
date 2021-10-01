
module.exports = (sequelize, DataTypes) => {
    const Reciclado = sequelize.define('Reciclado', {
        nome: DataTypes.STRING,
        tipo: DataTypes.STRING,
        ponto: DataTypes.INTEGER,
        unidade: DataTypes.STRING,
    });

    Reciclado.associate = (models) => {

        Reciclado.belongsToMany(models.EstoqueRec, {
            through: 'estoquerecs',
            as: 'rec_etqr',
            foreignKey: 'rec_etqr',
            onDelete: "CASCADE"
        });

    };

    return Reciclado;
}
module.exports = (sequelize, DataTypes) => {
    const Cidade = sequelize.define('Cidade', {
        nome: DataTypes.STRING,
        estado: DataTypes.STRING,
        createdAt: {
            allowNull: false,
            type: DataTypes.DATE,
            defaultValue: DataTypes.NOW
        },
        updatedAt: {
            allowNull: false,
            type: DataTypes.DATE,
            defaultValue: DataTypes.NOW
        }
    });

    Cidade.afterUpdate(async (cidade, options) => {
        const updateDate = DataTypes.NOW;
        cidade.updatedAt = updateDate;
    });

    Cidade.associate = (models) => {
        Cidade.belongsToMany(models.Usuario, {
            through: 'usuarios',
            as: 'cid_usu',
            foreignKey: 'cid_usu',
            onDelete: "CASCADE"
        });

        Cidade.belongsToMany(models.Estacao, {
            through: 'estacaos',
            as: 'cid_est',
            foreignKey: 'cid_est',
            onDelete: "CASCADE"
        });
    };

    return Cidade;
}
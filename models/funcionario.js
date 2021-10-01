const crypto = require('crypto');

module.exports = (sequelize, DataTypes) => {
    const Funcionario = sequelize.define('Funcionario', {
        nome: DataTypes.STRING,
        email: {
            type: DataTypes.STRING,
            allowNull: false,
            validade: {
                isEmail: true,
                notEmpty: true,
            }
        },
        pass: {
            type: DataTypes.STRING,
            allowNull: false,
            validade: {
                len: [6, 20],
                notEmpty: true,
            }
        },
        endereco: DataTypes.STRING,
        fone: DataTypes.STRING,
    });

    Funcionario.beforeCreate(async (funcionario, options) => {
        funcionario.pass = crypto.createHmac('sha256', funcionario.pass)
            .update('Palmeiras nao tem mundial')
            .digest('hex');
    })

    Funcionario.associate = (models) => {

        Funcionario.belongsTo(models.Estacao, { onDelete: "CASCADE" });
        Funcionario.belongsToMany(models.Reciclagem, {
            through: 'reciclagems',
            as: 'func_rec',
            foreignKey: 'func_rec',
            onDelete: "CASCADE"
        });

    };

    return Funcionario;
}
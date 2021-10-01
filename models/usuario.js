const crypto = require('crypto');

module.exports = (sequelize, DataTypes) => {
    const Usuario = sequelize.define('Usuario', {
        nome: {
            type: DataTypes.STRING,
            allowNull: false
        },
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
        pontuacao: {
            type: DataTypes.INTEGER,
            validate: {
                isInt: true,
                notEmpty: true,
            },
            defaultValue: 500,
        },
        endereco: DataTypes.STRING,
        fone: DataTypes.STRING,
    });

    Usuario.beforeCreate(async (usuario, options) => {
        usuario.pass = crypto.createHmac('sha256', usuario.pass)
            .update('Palmeiras nao tem mundial')
            .digest('hex');
    })

    Usuario.associate = (models) => {
        Usuario.belongsToMany(models.Cupom, {
            through: 'cupoms',
            as: 'usu_cup',
            foreignKey: 'usu_cup',
            onDelete: "CASCADE"
        });
        Usuario.belongsToMany(models.Reciclagem, {
            through: 'usuarios',
            as: 'usu_rec',
            foreignKey: 'usu_rec',
            onDelete: "CASCADE"
        });

        Usuario.belongsTo(models.Cidade);
    };

    return Usuario;
}
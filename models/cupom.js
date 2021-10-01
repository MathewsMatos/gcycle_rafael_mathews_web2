module.exports = (sequelize, DataTypes) => {
  const Cupom = sequelize.define('Cupom', {
    codigo: DataTypes.STRING,
    custo: DataTypes.INTEGER, // igual valor do ProdutoId
    isResgatado: {
      type: DataTypes.BOOLEAN,
      defaultValue: false,
    },
    createdAt: {
      allowNull: false,
      type: DataTypes.DATE,
    },
    dtval: {
      type: DataTypes.DATE,
      defaultValue: DataTypes.NOW,
    },
    isactive: {
      allowNull: false,
      type: DataTypes.BOOLEAN,
      defaultValue: true
    },
  });

  Cupom.beforeCreate(async (cupom, options) => {
    function func(length) {
      var result = '';
      var characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
      var charactersLength = characters.length;
      for (var i = 0; i < length; i++) {
        result += characters.charAt(Math.floor(Math.random() *
          charactersLength));
      }
      return result;
    }

    var cod = func(5);

    cupom.codigo = cod;
  })

  Cupom.afterCreate(async (cupom, options) => {
    sequelize.query("update cupoms set dtval = (current_timestamp() + interval '5' day) where id = " + cupom.id)
  })

  Cupom.associate = (models) => {

    Cupom.belongsTo(models.Produto, { onDelete: "CASCADE" });
    Cupom.belongsTo(models.Usuario, { onDelete: "CASCADE" });

  };

  return Cupom;
}
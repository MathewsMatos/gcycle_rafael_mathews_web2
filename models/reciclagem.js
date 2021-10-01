const Reciclado = require('./reciclado');

module.exports = (sequelize, DataTypes) => {
    const Reciclagem = sequelize.define('Reciclagem', {
        qtdReciclado: DataTypes.INTEGER,
        qtdPonto: DataTypes.INTEGER,
    });

    Reciclagem.beforeUpdate(async (reciclagem, options) => {
        sequelize.query("insert into estoquerecs (estoquerecs.id, estoquerecs.RecicladoId," +
            "estoquerecs.EstacaoId) values(" + reciclagem.EstoqueRecId + ", " +
            reciclagem.RecicladoId + ", " + reciclagem.EstacaoId +
            ") on duplicate key update estoquerecs.RecicladoId = " + reciclagem.EstoqueRecId + "," +
            "estoquerecs.EstacaoId = " + reciclagem.EstacaoId + ");"
        )
    })

    Reciclagem.afterCreate(async (reciclagem, options) => {

        sequelize.query("update estoquerecs inner join reciclagems on estoquerecs.id = " +
        reciclagem.EstoqueRecId + " set estoquerecs.qtdRec = estoquerecs.qtdRec + " + reciclagem.qtdReciclado + ";" + 
        "update reciclagems inner join reciclados on " + reciclagem.RecicladoId +
            " = reciclados.id set reciclagems.qtdPonto = reciclagems.qtdReciclado * reciclados.ponto;" + 
            "update usuarios set usuarios.pontuacao = usuarios.pontuacao +" + reciclagem.qtdPonto +
            " where usuarios.id = " + reciclagem.UsuarioId + ";");

    })

    Reciclagem.associate = (models) => {


        Reciclagem.belongsTo(models.Reciclado, { onDelete: "CASCADE" });
        Reciclagem.belongsTo(models.Funcionario, { onDelete: "CASCADE" });
        Reciclagem.belongsTo(models.Usuario, { onDelete: "CASCADE" });
        Reciclagem.belongsTo(models.EstoqueRec, { onDelete: "CASCADE" });

    };

    return Reciclagem;
}
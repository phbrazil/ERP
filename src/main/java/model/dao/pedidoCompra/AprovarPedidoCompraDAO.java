/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao.pedidoCompra;

import java.sql.Connection;
import java.sql.PreparedStatement;
import model.dao.conexao.Conexao;

/**
 *
 * @author paulo.bezerra
 */
public class AprovarPedidoCompraDAO {

    public boolean AprovarPedido(int id) {

        boolean atualizado = false;

        Conexao bancoconexao = new Conexao();

        try {
            

            Connection conexao = bancoconexao.getConnection();

            String query = ("update tbPedidoCompra set aprovado = true where "
                    + " id = ?;");

            PreparedStatement preparedStmt = conexao.prepareStatement(query);
            preparedStmt.setInt(1, id);

            preparedStmt.execute();

            atualizado = true;

            conexao.close();
            preparedStmt.close();
        } catch (Exception e) {

            System.out.println("Erro aprovar/rejeiatar pedido " + e.getMessage());

        }
        return atualizado;
    }

}

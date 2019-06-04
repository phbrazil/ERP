/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.pedidoCompra;

import java.sql.Connection;
import java.sql.ResultSet;
import model.dao.conexao.Conexao;

/**
 *
 * @author paulo.bezerra
 */
public class GetEmailFornecedor {

    private Connection conexao = null;

    private String email = "";


    public String getEmail(String razaosocial) {
        

        String select = "";

        Conexao bancoconexao = new Conexao();

        try {
            //Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
            //Class.forName("com.mysql.cj.jdbc.Driver");
            //Class.forName("com.sqlserver.cj.jdbc.Driver");

            conexao = bancoconexao.getConnection();

            java.sql.Statement st = conexao.createStatement();

            select = "select email from tbvendors where razaosocial = '"+razaosocial+"'";
            
            ResultSet result = st.executeQuery(select);

            while (result.next()) {
                email = result.getString("email");

            }


            conexao.close();
            st.close();

        } catch (Exception e) {

            System.out.println("Erro get Email. " + e.getMessage());

        }

        return email;

    }

}

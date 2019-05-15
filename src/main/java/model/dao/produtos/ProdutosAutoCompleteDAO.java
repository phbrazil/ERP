/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao.produtos;

import java.sql.Connection;
import java.sql.ResultSet;
import model.dao.conexao.Conexao;

/**
 *
 * @author paulo.bezerra
 */
public class ProdutosAutoCompleteDAO {

    private Connection conexao = null;

    public String AutoComplete() {

        String selectgeral = "";
        String produtos = "";

        Conexao bancoconexao = new Conexao();
        
        //ConexaoSAP bancoconexao = new ConexaoSAP();
        

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            conexao = bancoconexao.getConnection();

            java.sql.Statement st = conexao.createStatement();

            selectgeral = "select nomeprod from tbProduto";
            //selectgeral = "select DISTINCT cardname from OCRD where CardType = 'c'";
            ResultSet resultgeral = st.executeQuery(selectgeral);
            while (resultgeral.next()) {
                
                produtos = produtos +"|"+resultgeral.getString("nomeprod");
            }
            conexao.close();

        } catch (Exception e) {

            System.out.println("Error: " + e.getMessage());

        }
        return produtos;
    }

}

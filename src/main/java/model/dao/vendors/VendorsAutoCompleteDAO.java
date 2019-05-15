/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao.vendors;

import java.sql.Connection;
import java.sql.ResultSet;
import model.dao.conexao.Conexao;

/**
 *
 * @author paulo.bezerra
 */
public class VendorsAutoCompleteDAO {

    private Connection conexao = null;

    public String AutoComplete() {

        String selectgeral = "";
        String clientes= "";

        Conexao bancoconexao = new Conexao();
        
        //ConexaoSAP bancoconexao = new ConexaoSAP();
        

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            conexao = bancoconexao.getConnection();

            java.sql.Statement st = conexao.createStatement();

            selectgeral = "select nomefantasia from tbVendors";
            //selectgeral = "select DISTINCT cardname from OCRD where CardType = 'c'";
            ResultSet resultgeral = st.executeQuery(selectgeral);
            while (resultgeral.next()) {
                
                clientes = clientes +"|"+resultgeral.getString("nomefantasia");
            }

            conexao.close();

        } catch (Exception e) {

            System.out.println("Error: " + e.getMessage());

        }
        return clientes;
    }

}

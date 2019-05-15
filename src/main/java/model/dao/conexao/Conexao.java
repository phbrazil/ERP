/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao.conexao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author paulo.bezerra
 */
public class Conexao {

    private String url = "jdbc:mysql://localhost:3306/erp?useTimezone=true&serverTimezone=UTC";
    

    //private String driver = "com.mysql.jdbc.Driver";
   private String driver = "com.mysql.cj.jdbc.Driver";
    

    private String userName = "erp";
    private String password = "senac";
    private Connection conexao = null;

    /*
    CREATE USER 'mci'@'localhost' IDENTIFIED BY '0c24a188a9';
    GRANT ALL PRIVILEGES ON * . * TO 'mci'@'localhost';
    ALTER USER 'mci'@'localhost' IDENTIFIED WITH mysql_native_password BY '0c24a188a9';
     */

    public Connection getConnection() throws SQLException {

        try {
            Class.forName(driver);
            if (conexao == null) {
                
                conexao = DriverManager.getConnection(url, userName, password);
                
            }
        } catch (Exception e) {
            System.out.print("Erro na conexao: " + e.getMessage());
        }
        return conexao;
    }

}

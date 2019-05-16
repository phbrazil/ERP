/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao.pedidoCompra;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.dao.conexao.Conexao;
import model.pedidoCompra.tbPedidoCompra;

/**
 *
 * @author paulo.bezerra
 */
public class ListarPedidosCompraDAO {

    private Connection conexao = null;

    public ArrayList<tbPedidoCompra> ListarPedidos() {

        ArrayList<tbPedidoCompra> pedidosList = new ArrayList<tbPedidoCompra>();

        tbPedidoCompra pedido = new tbPedidoCompra(0,
                null, null, 0, null, null, null, null, true, null, null);

        String selectgeral = "";

        Conexao bancoconexao = new Conexao();

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            conexao = bancoconexao.getConnection();

            java.sql.Statement st = conexao.createStatement();

            selectgeral = "select * from tbPedidoCompra";

            ResultSet resultgeral = st.executeQuery(selectgeral);

            while (resultgeral.next()) {

                pedido.setId(resultgeral.getInt("id"));
                pedido.setRazaosocial(resultgeral.getString("razaosocial"));
                pedido.setNomeprod(resultgeral.getString("nomeprod"));
                pedido.setQtd(resultgeral.getInt("qtd"));
                pedido.setParcelamento(resultgeral.getString("parcelamento"));
                pedido.setEntrega(resultgeral.getString("entrega"));
                pedido.setPrioridade(resultgeral.getString("prioridade"));
                pedido.setObs(resultgeral.getString("obs"));
                pedido.setAprovado(resultgeral.getBoolean("aprovado"));
                pedido.setCreatedby(resultgeral.getString("createdby"));
                pedido.setDatacadastro(resultgeral.getString("datacadastro"));

                pedidosList.add(new tbPedidoCompra(pedido.getId(),
                        pedido.getRazaosocial(), pedido.getNomeprod(), pedido.getQtd(),
                        pedido.getParcelamento(), pedido.getEntrega(), pedido.getPrioridade(), 
                        pedido.getObs(), pedido.isAprovado(),
                        pedido.getCreatedby(), pedido.getDatacadastro()));
            }

            conexao.close();
            st.close();

        } catch (Exception e) {

            System.out.println("Erro task pendencias " + e.getMessage());

        }
        return pedidosList;
    }

}

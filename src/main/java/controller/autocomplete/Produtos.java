/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.autocomplete;

/**
 *
 * @author paulo.bezerra
 */

import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;
import model.dao.produtos.ProdutosAutoCompleteDAO;
import model.dao.vendors.VendorsAutoCompleteDAO;

public class Produtos {
	private int totalprodutos;
        
        ProdutosAutoCompleteDAO produtosNome = new ProdutosAutoCompleteDAO();
	private String data = produtosNome.AutoComplete();
	private List<String> produtos;
	public Produtos() {
		produtos = new ArrayList<String>();
		StringTokenizer st = new StringTokenizer(data, "|");
		
		while(st.hasMoreTokens()) {
			produtos.add(st.nextToken().trim());
		}
		totalprodutos = produtos.size();
	}
	
	public List<String> getData(String query) {
		String lista = null;
		query = query.toLowerCase();
		List<String> matched = new ArrayList<String>();
		for(int i=0; i<totalprodutos; i++) {
			lista = produtos.get(i).toLowerCase();
			if(lista.toUpperCase().contains(query.toUpperCase())) {
				matched.add(produtos.get(i));
			}
		}
		return matched;
	}
}
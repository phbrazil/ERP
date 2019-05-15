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
import model.dao.vendors.VendorsAutoCompleteDAO;

public class Vendors {
	private int totalclientes;
        
        VendorsAutoCompleteDAO vendorsName = new VendorsAutoCompleteDAO();
	private String data = vendorsName.AutoComplete();
	private List<String> vendors;
	public Vendors() {
		vendors = new ArrayList<String>();
		StringTokenizer st = new StringTokenizer(data, "|");
		
		while(st.hasMoreTokens()) {
			vendors.add(st.nextToken().trim());
		}
		totalclientes = vendors.size();
	}
	
	public List<String> getData(String query) {
		String lista = null;
		query = query.toLowerCase();
		List<String> matched = new ArrayList<String>();
		for(int i=0; i<totalclientes; i++) {
			lista = vendors.get(i).toLowerCase();
			if(lista.toUpperCase().contains(query.toUpperCase())) {
				matched.add(vendors.get(i));
			}
		}
		return matched;
	}
}
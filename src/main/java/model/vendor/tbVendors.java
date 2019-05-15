/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.vendor;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 *
 * @author killuminatti08
 */
@Entity
public class tbVendors implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;

    private String razaosocial;
    private String cnpj;
    private String nomefantasia;
    private String website;
    private String industrysector;
    private String phone1;
    private String phone2;
    private String contato;
    private String cargo;
    private String email;
    private String createdby;
    private String datacadastro;


    public String getCreatedby() {
        return createdby;
    }

    public void setCreatedby(String createdby) {
        this.createdby = createdby;
    }

    public tbVendors(Integer id, String razaosocial, String cnpj,
            String nomefantasia, String website, String industrysector,
            String phone1, String phone2, String contato, String cargo,
            String email, String createdby, String datacadastro) {
        this.id = id;
        this.razaosocial = razaosocial;
        this.cnpj = cnpj;
        this.nomefantasia = nomefantasia;
        this.website = website;
        this.industrysector = industrysector;
        this.phone1 = phone1;
        this.phone2 = phone2;
        this.contato = contato;
        this.cargo = cargo;
        this.email = email;
        this.createdby = createdby;
        this.datacadastro = datacadastro;
    }

    public String getDatacadastro() {
        return datacadastro;
    }

    public void setDatacadastro(String datacadastro) {
        this.datacadastro = datacadastro;
    }
    
    

    public String getRazaosocial() {
        return razaosocial;
    }

    public void setRazaosocial(String razaosocial) {
        this.razaosocial = razaosocial;
    }

    public String getCnpj() {
        return cnpj;
    }

    public void setCnpj(String cnpj) {
        this.cnpj = cnpj;
    }

    public String getNomefantasia() {
        return nomefantasia;
    }

    public void setNomefantasia(String nomefantasia) {
        this.nomefantasia = nomefantasia;
    }

    public String getWebsite() {
        return website;
    }

    public void setWebsite(String website) {
        this.website = website;
    }

    public String getIndustrysector() {
        return industrysector;
    }

    public void setIndustrysector(String industrysector) {
        this.industrysector = industrysector;
    }

    public String getPhone1() {
        return phone1;
    }

    public void setPhone1(String phone1) {
        this.phone1 = phone1;
    }

    public String getPhone2() {
        return phone2;
    }

    public void setPhone2(String phone2) {
        this.phone2 = phone2;
    }

    public String getContato() {
        return contato;
    }

    public void setContato(String contato) {
        this.contato = contato;
    }

    public String getCargo() {
        return cargo;
    }

    public void setCargo(String cargo) {
        this.cargo = cargo;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof tbVendors)) {
            return false;
        }
        tbVendors other = (tbVendors) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "controller.vendor.tbVendors[ id=" + id + " ]";
    }

}

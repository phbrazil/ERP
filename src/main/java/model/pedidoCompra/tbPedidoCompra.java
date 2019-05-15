/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.pedidoCompra;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 *
 * @author paulo.bezerra
 */
@Entity
public class tbPedidoCompra implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;
    
    private String razaosocial;
    private String nomeprod;
    private int qtd;
    private String parcelamento;
    private String entrega;
    private String prioridade;
    private String obs;
    private boolean aprovado;
    private String createdby;
    private String datacadastro;

    public String getCreatedby() {
        return createdby;
    }

    public void setCreatedby(String createdby) {
        this.createdby = createdby;
    }

    public String getDatacadastro() {
        return datacadastro;
    }

    public void setDatacadastro(String datacadastro) {
        this.datacadastro = datacadastro;
    }
    
    
    
    
    
    public tbPedidoCompra(Integer id, String razaosocial, String nomeprod, int qtd, 
            String parcelamento, String entrega, String prioridade, 
            String obs, boolean aprovado, String createdby, String datacadastro) {
        this.id = id;
        this.razaosocial = razaosocial;
        this.nomeprod = nomeprod;
        this.qtd = qtd;
        this.parcelamento = parcelamento;
        this.entrega = entrega;
        this.prioridade = prioridade;
        this.obs = obs;
        this.aprovado = aprovado;
        this.createdby = createdby;
        this.datacadastro = datacadastro;
    }

    public boolean isAprovado() {
        return aprovado;
    }

    public void setAprovado(boolean aprovado) {
        this.aprovado = aprovado;
    }
    
    

    public String getRazaosocial() {
        return razaosocial;
    }

    public void setRazaosocial(String razaosocial) {
        this.razaosocial = razaosocial;
    }

    public String getNomeprod() {
        return nomeprod;
    }

    public void setNomeprod(String nomeprod) {
        this.nomeprod = nomeprod;
    }

    public int getQtd() {
        return qtd;
    }

    public void setQtd(int qtd) {
        this.qtd = qtd;
    }

    public String getParcelamento() {
        return parcelamento;
    }

    public void setParcelamento(String parcelamento) {
        this.parcelamento = parcelamento;
    }

    public String getEntrega() {
        return entrega;
    }

    public void setEntrega(String entrega) {
        this.entrega = entrega;
    }

    public String getPrioridade() {
        return prioridade;
    }

    public void setPrioridade(String prioridade) {
        this.prioridade = prioridade;
    }

    public String getObs() {
        return obs;
    }

    public void setObs(String obs) {
        this.obs = obs;
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
        if (!(object instanceof tbPedidoCompra)) {
            return false;
        }
        tbPedidoCompra other = (tbPedidoCompra) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.model.pedidoCompra.pedidoCompra[ id=" + id + " ]";
    }
    
}

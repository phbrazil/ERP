/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.pedidoCompra;

import java.io.Serializable;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import javax.transaction.UserTransaction;
import model.pedidoCompra.exceptions.NonexistentEntityException;
import model.pedidoCompra.exceptions.RollbackFailureException;

/**
 *
 * @author paulo.bezerra
 */
public class tbPedidoCompraJpaController implements Serializable {

    public tbPedidoCompraJpaController(UserTransaction utx, EntityManagerFactory emf) {
        this.utx = utx;
        this.emf = emf;
    }
    private UserTransaction utx = null;
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(tbPedidoCompra pedidoCompra) throws RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            em.persist(pedidoCompra);
            utx.commit();
        } catch (Exception ex) {
            try {
                utx.rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(tbPedidoCompra pedidoCompra) throws NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            pedidoCompra = em.merge(pedidoCompra);
            utx.commit();
        } catch (Exception ex) {
            try {
                utx.rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Integer id = pedidoCompra.getId();
                if (findpedidoCompra(id) == null) {
                    throw new NonexistentEntityException("The pedidoCompra with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void destroy(Integer id) throws NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            tbPedidoCompra pedidoCompra;
            try {
                pedidoCompra = em.getReference(tbPedidoCompra.class, id);
                pedidoCompra.getId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The pedidoCompra with id " + id + " no longer exists.", enfe);
            }
            em.remove(pedidoCompra);
            utx.commit();
        } catch (Exception ex) {
            try {
                utx.rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<tbPedidoCompra> findpedidoCompraEntities() {
        return findpedidoCompraEntities(true, -1, -1);
    }

    public List<tbPedidoCompra> findpedidoCompraEntities(int maxResults, int firstResult) {
        return findpedidoCompraEntities(false, maxResults, firstResult);
    }

    private List<tbPedidoCompra> findpedidoCompraEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(tbPedidoCompra.class));
            Query q = em.createQuery(cq);
            if (!all) {
                q.setMaxResults(maxResults);
                q.setFirstResult(firstResult);
            }
            return q.getResultList();
        } finally {
            em.close();
        }
    }

    public tbPedidoCompra findpedidoCompra(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(tbPedidoCompra.class, id);
        } finally {
            em.close();
        }
    }

    public int getpedidoCompraCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<tbPedidoCompra> rt = cq.from(tbPedidoCompra.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}

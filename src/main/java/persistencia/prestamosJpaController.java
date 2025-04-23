/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package persistencia;

import java.io.Serializable;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.Persistence;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import logica.prestamos;
import logica.usuarios;
import persistencia.exceptions.NonexistentEntityException;

/**
 *
 * @author XicYac
 */
public class prestamosJpaController implements Serializable {

    public prestamosJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }

    public prestamosJpaController() {
        emf = Persistence.createEntityManagerFactory("persistencia");
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(prestamos prestamos) {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            usuarios unUsuario = prestamos.getUnUsuario();
            if (unUsuario != null) {
                unUsuario = em.getReference(unUsuario.getClass(), unUsuario.getId());
                prestamos.setUnUsuario(unUsuario);
            }
            em.persist(prestamos);
            if (unUsuario != null) {
                unUsuario.getListaPrestamos().add(prestamos);
                unUsuario = em.merge(unUsuario);
            }
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(prestamos prestamos) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            prestamos persistentprestamos = em.find(prestamos.class, prestamos.getId());
            usuarios unUsuarioOld = persistentprestamos.getUnUsuario();
            usuarios unUsuarioNew = prestamos.getUnUsuario();
            if (unUsuarioNew != null) {
                unUsuarioNew = em.getReference(unUsuarioNew.getClass(), unUsuarioNew.getId());
                prestamos.setUnUsuario(unUsuarioNew);
            }
            prestamos = em.merge(prestamos);
            if (unUsuarioOld != null && !unUsuarioOld.equals(unUsuarioNew)) {
                unUsuarioOld.getListaPrestamos().remove(prestamos);
                unUsuarioOld = em.merge(unUsuarioOld);
            }
            if (unUsuarioNew != null && !unUsuarioNew.equals(unUsuarioOld)) {
                unUsuarioNew.getListaPrestamos().add(prestamos);
                unUsuarioNew = em.merge(unUsuarioNew);
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                int id = prestamos.getId();
                if (findprestamos(id) == null) {
                    throw new NonexistentEntityException("The prestamos with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void destroy(int id) throws NonexistentEntityException {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            prestamos prestamos;
            try {
                prestamos = em.getReference(prestamos.class, id);
                prestamos.getId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The prestamos with id " + id + " no longer exists.", enfe);
            }
            usuarios unUsuario = prestamos.getUnUsuario();
            if (unUsuario != null) {
                unUsuario.getListaPrestamos().remove(prestamos);
                unUsuario = em.merge(unUsuario);
            }
            em.remove(prestamos);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<prestamos> findprestamosEntities() {
        return findprestamosEntities(true, -1, -1);
    }

    public List<prestamos> findprestamosEntities(int maxResults, int firstResult) {
        return findprestamosEntities(false, maxResults, firstResult);
    }

    private List<prestamos> findprestamosEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(prestamos.class));
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

    public prestamos findprestamos(int id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(prestamos.class, id);
        } finally {
            em.close();
        }
    }

    public int getprestamosCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<prestamos> rt = cq.from(prestamos.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }

}

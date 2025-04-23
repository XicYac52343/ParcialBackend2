/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package persistencia;

import java.io.Serializable;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import logica.prestamos;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import logica.usuarios;
import persistencia.exceptions.NonexistentEntityException;

/**
 *
 * @author XicYac
 */
public class usuariosJpaController implements Serializable {

    public usuariosJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
        public usuariosJpaController(){
        emf = Persistence.createEntityManagerFactory("persistencia");
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(usuarios usuarios) {
        if (usuarios.getListaPrestamos() == null) {
            usuarios.setListaPrestamos(new ArrayList<prestamos>());
        }
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            List<prestamos> attachedListaPrestamos = new ArrayList<prestamos>();
            for (prestamos listaPrestamosprestamosToAttach : usuarios.getListaPrestamos()) {
                listaPrestamosprestamosToAttach = em.getReference(listaPrestamosprestamosToAttach.getClass(), listaPrestamosprestamosToAttach.getId());
                attachedListaPrestamos.add(listaPrestamosprestamosToAttach);
            }
            usuarios.setListaPrestamos(attachedListaPrestamos);
            em.persist(usuarios);
            for (prestamos listaPrestamosprestamos : usuarios.getListaPrestamos()) {
                usuarios oldUnUsuarioOfListaPrestamosprestamos = listaPrestamosprestamos.getUnUsuario();
                listaPrestamosprestamos.setUnUsuario(usuarios);
                listaPrestamosprestamos = em.merge(listaPrestamosprestamos);
                if (oldUnUsuarioOfListaPrestamosprestamos != null) {
                    oldUnUsuarioOfListaPrestamosprestamos.getListaPrestamos().remove(listaPrestamosprestamos);
                    oldUnUsuarioOfListaPrestamosprestamos = em.merge(oldUnUsuarioOfListaPrestamosprestamos);
                }
            }
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(usuarios usuarios) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            usuarios persistentusuarios = em.find(usuarios.class, usuarios.getId());
            List<prestamos> listaPrestamosOld = persistentusuarios.getListaPrestamos();
            List<prestamos> listaPrestamosNew = usuarios.getListaPrestamos();
            List<prestamos> attachedListaPrestamosNew = new ArrayList<prestamos>();
            for (prestamos listaPrestamosNewprestamosToAttach : listaPrestamosNew) {
                listaPrestamosNewprestamosToAttach = em.getReference(listaPrestamosNewprestamosToAttach.getClass(), listaPrestamosNewprestamosToAttach.getId());
                attachedListaPrestamosNew.add(listaPrestamosNewprestamosToAttach);
            }
            listaPrestamosNew = attachedListaPrestamosNew;
            usuarios.setListaPrestamos(listaPrestamosNew);
            usuarios = em.merge(usuarios);
            for (prestamos listaPrestamosOldprestamos : listaPrestamosOld) {
                if (!listaPrestamosNew.contains(listaPrestamosOldprestamos)) {
                    listaPrestamosOldprestamos.setUnUsuario(null);
                    listaPrestamosOldprestamos = em.merge(listaPrestamosOldprestamos);
                }
            }
            for (prestamos listaPrestamosNewprestamos : listaPrestamosNew) {
                if (!listaPrestamosOld.contains(listaPrestamosNewprestamos)) {
                    usuarios oldUnUsuarioOfListaPrestamosNewprestamos = listaPrestamosNewprestamos.getUnUsuario();
                    listaPrestamosNewprestamos.setUnUsuario(usuarios);
                    listaPrestamosNewprestamos = em.merge(listaPrestamosNewprestamos);
                    if (oldUnUsuarioOfListaPrestamosNewprestamos != null && !oldUnUsuarioOfListaPrestamosNewprestamos.equals(usuarios)) {
                        oldUnUsuarioOfListaPrestamosNewprestamos.getListaPrestamos().remove(listaPrestamosNewprestamos);
                        oldUnUsuarioOfListaPrestamosNewprestamos = em.merge(oldUnUsuarioOfListaPrestamosNewprestamos);
                    }
                }
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                int id = usuarios.getId();
                if (findusuarios(id) == null) {
                    throw new NonexistentEntityException("The usuarios with id " + id + " no longer exists.");
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
            usuarios usuarios;
            try {
                usuarios = em.getReference(usuarios.class, id);
                usuarios.getId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The usuarios with id " + id + " no longer exists.", enfe);
            }
            List<prestamos> listaPrestamos = usuarios.getListaPrestamos();
            for (prestamos listaPrestamosprestamos : listaPrestamos) {
                listaPrestamosprestamos.setUnUsuario(null);
                listaPrestamosprestamos = em.merge(listaPrestamosprestamos);
            }
            em.remove(usuarios);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<usuarios> findusuariosEntities() {
        return findusuariosEntities(true, -1, -1);
    }

    public List<usuarios> findusuariosEntities(int maxResults, int firstResult) {
        return findusuariosEntities(false, maxResults, firstResult);
    }

    private List<usuarios> findusuariosEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(usuarios.class));
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

    public usuarios findusuarios(int id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(usuarios.class, id);
        } finally {
            em.close();
        }
    }

    public int getusuariosCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<usuarios> rt = cq.from(usuarios.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}

package persistencia;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.EntityManager;
import javax.persistence.Query;
import logica.libros;
import logica.prestamos;
import logica.usuarios;
import persistencia.exceptions.NonexistentEntityException;

public class controladoraPersistencia {

    usuariosJpaController usuariosPersis = new usuariosJpaController();
    librosJpaController libroPersis = new librosJpaController();
    prestamosJpaController prestamoPersis = new prestamosJpaController();

    public void crearUsuario(usuarios usu) {
        usuariosPersis.create(usu);
    }

    public void crearLibro(libros libro) {
        libroPersis.create(libro);
    }

    public void crearPrestamo(prestamos prestamo) {
        prestamoPersis.create(prestamo);
    }

    public List<usuarios> traerUsuarios() {
        return usuariosPersis.findusuariosEntities();
    }

    public usuarios traerUsuario(int id) {
        return usuariosPersis.findusuarios(id);
    }

    public List<libros> traerLibros() {
        return libroPersis.findlibrosEntities();
    }

    public libros traerLibro(int id) {
        return libroPersis.findlibros(id);
    }
    
    public prestamos traerPrestamo(int id){
        return prestamoPersis.findprestamos(id);
    }
    
    public List<prestamos> traerPrestamos(){
        return prestamoPersis.findprestamosEntities();
    }

    public List<prestamos> traerPrestamosPersona(usuarios usu) {
        EntityManager em = prestamoPersis.getEntityManager();
        int idUsuario = usu.getId();
        Query query = em.createQuery("SELECT t FROM prestamos t WHERE t.unUsuario.id = :idUsu AND t.estado = \"prestado\" OR t.estado = \"noDevuelto\"");
        query.setParameter("idUsu", idUsuario);
        List<prestamos> listaPrestamos = query.getResultList();
        return listaPrestamos;
    }

    public void editarUsuario(usuarios usu) {
        try {
            usuariosPersis.edit(usu);
        } catch (Exception ex) {
            Logger.getLogger(controladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void editarLibro(libros libro) {
        try {
            libroPersis.edit(libro);
        } catch (Exception ex) {
            Logger.getLogger(controladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void editarPrestamo(prestamos prestamo){
        try {
            prestamoPersis.edit(prestamo);
        } catch (Exception ex) {
            Logger.getLogger(controladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void eliminarLibro(int id){
        try {
            libroPersis.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(controladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void eliminarUsuario(int id){
        try {
            usuariosPersis.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(controladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}

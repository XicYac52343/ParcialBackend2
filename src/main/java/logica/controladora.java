package logica;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import persistencia.controladoraPersistencia;


public class controladora {
    controladoraPersistencia controlPersis = new controladoraPersistencia();
     
    public void crearUsuario(usuarios usu){
        controlPersis.crearUsuario(usu);
    }
    
    public void crearLibro(libros libro){
        controlPersis.crearLibro(libro);
    }
    
    public void crearPrestamo(libros libro, usuarios usu){
        prestamos prestamo = new prestamos();
        LocalDate fecha_prestamo = LocalDate.now();
        LocalDate fecha_devolucion = fecha_prestamo.plusDays(14);
        
        
        prestamo.setFecha_prestamo(fecha_prestamo);
        prestamo.setFecha_devolucion(fecha_devolucion);
        prestamo.setUnLibro(libro);
        prestamo.setUnUsuario(usu);
        prestamo.setEstado("prestado");
        
        
        controlPersis.crearPrestamo(prestamo);
    }
    
    public usuarios validarSesion(String correo, String contrasenia){
        List<usuarios> listaUsuarios = new ArrayList<>();
        
        listaUsuarios = controlPersis.traerUsuarios();
        
        for(usuarios usu : listaUsuarios){
            if(correo.equals(usu.getCorreo()) && contrasenia.equals(usu.getContrasenia())){
                return usu;
            }
        }
        return null;
    }
    
    public usuarios traerUsuario(int id){
        return controlPersis.traerUsuario(id);
    }
    
    public List<usuarios> traerUsuarios(){
        return controlPersis.traerUsuarios();
    }
    
    public List<libros> traerLibros(){
        return controlPersis.traerLibros();
    }
    
    public libros traerLibro(int id){
        return controlPersis.traerLibro(id);
    }
    
    public prestamos traerPrestamo(int id){
        return controlPersis.traerPrestamo(id);
    }
    
    public List<prestamos> traerPrestamos(){
        return controlPersis.traerPrestamos();
    }
    
    public List<prestamos> traerPrestamosPersona(usuarios usu){
        return controlPersis.traerPrestamosPersona(usu);
    }
    
    public void editarUsuario(usuarios usu){
        controlPersis.editarUsuario(usu);
    }
    
    public void editarLibro(libros libro){
        controlPersis.editarLibro(libro);
    }

    public void editarPrestamo(prestamos prestamo){
        controlPersis.editarPrestamo(prestamo);
    }
    
    public void eliminarLibro(int id){
        controlPersis.eliminarLibro(id);
    }
    
    public void eliminarUsuario(int id){
        controlPersis.eliminarUsuario(id);
    }
}

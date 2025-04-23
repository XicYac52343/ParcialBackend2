package logica;

import java.io.Serializable;
import java.time.LocalDate;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

@Entity
public class prestamos implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    private LocalDate fecha_prestamo, fecha_devolucion;
    private String estado;

    @OneToOne
    private libros unLibro;

    @ManyToOne
    @JoinColumn(name = "usuario_id")  
    private usuarios unUsuario;

    public prestamos() {

    }

    public prestamos(int id, LocalDate fecha_prestamo, LocalDate fecha_devolucion, String estado, libros unLibro, usuarios unUsuario) {
        this.id = id;
        this.fecha_prestamo = fecha_prestamo;
        this.fecha_devolucion = fecha_devolucion;
        this.estado = estado;
        this.unLibro = unLibro;
        this.unUsuario = unUsuario;
    }

    public LocalDate getFecha_prestamo() {
        return fecha_prestamo;
    }

    public void setFecha_prestamo(LocalDate fecha_prestamo) {
        this.fecha_prestamo = fecha_prestamo;
    }

    public LocalDate getFecha_devolucion() {
        return fecha_devolucion;
    }

    public void setFecha_devolucion(LocalDate fecha_devolucion) {
        this.fecha_devolucion = fecha_devolucion;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public libros getUnLibro() {
        return unLibro;
    }

    public void setUnLibro(libros unLibro) {
        this.unLibro = unLibro;
    }

    public usuarios getUnUsuario() {
        return unUsuario;
    }

    public void setUnUsuario(usuarios unUsuario) {
        this.unUsuario = unUsuario;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

}

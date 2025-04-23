package logica;

import java.time.LocalDate;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import logica.libros;
import logica.usuarios;

@Generated(value="EclipseLink-2.7.12.v20230209-rNA", date="2025-04-23T11:21:37")
@StaticMetamodel(prestamos.class)
public class prestamos_ { 

    public static volatile SingularAttribute<prestamos, usuarios> unUsuario;
    public static volatile SingularAttribute<prestamos, String> estado;
    public static volatile SingularAttribute<prestamos, LocalDate> fecha_prestamo;
    public static volatile SingularAttribute<prestamos, libros> unLibro;
    public static volatile SingularAttribute<prestamos, Integer> id;
    public static volatile SingularAttribute<prestamos, LocalDate> fecha_devolucion;

}
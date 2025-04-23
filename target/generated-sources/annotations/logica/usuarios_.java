package logica;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import logica.prestamos;

@Generated(value="EclipseLink-2.7.12.v20230209-rNA", date="2025-04-23T11:21:37")
@StaticMetamodel(usuarios.class)
public class usuarios_ { 

    public static volatile SingularAttribute<usuarios, String> apellido;
    public static volatile SingularAttribute<usuarios, String> correo;
    public static volatile SingularAttribute<usuarios, String> contrasenia;
    public static volatile SingularAttribute<usuarios, Integer> id;
    public static volatile SingularAttribute<usuarios, String> nombre;
    public static volatile ListAttribute<usuarios, prestamos> listaPrestamos;
    public static volatile SingularAttribute<usuarios, String> rol;

}
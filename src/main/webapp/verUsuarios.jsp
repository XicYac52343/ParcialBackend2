<%@page import="logica.prestamos"%>
<%@page import="logica.libros"%>
<%@page import="logica.controladora"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<html lang="en">
    <%@include file="layout/header.jsp" %>

</head>  
<body class="sb-nav-fixed">
    <%@include file="layout/navBar.jsp" %>
    <%@include file="layout/validarSesion.jsp"%>
    <div id="layoutSidenav">
        <%@include file="layout/layoutSidenav_nav.jsp" %>
        <div id="layoutSidenav_content">
            <main>
                <div class="mt-1 m-3" >

                    <div class="card mb-4">
                        <div class="card-header">
                            <i class="fas fa-table me-1"></i>
                            Libros:
                        </div>
                        <div class="card-body">
                            <table id="datatablesSimple">
                                <thead>
                                    <tr>
                                        <th>Id</th>
                                        <th>Nombre</th>
                                        <th>Apellido</th> 
                                        <th>Correo</th>
                                        <th>Contraseña</th>
                                        <th>Rol</th>
                                        <th>Opciones</th>
                                    </tr>
                                </thead>
                                <tbody>                             
                                    <%                                        
                                        controladora control = new controladora();
                                        List<usuarios> listaUsuarios = control.traerUsuarios();
                                        for (usuarios usu : listaUsuarios) {
                                    %>
                                    <tr>
                                        <td><%=usu.getId()%></td>
                                        <td><%=usu.getNombre()%></td>                            
                                        <td><%=usu.getApellido()%></td>
                                        <td><%=usu.getCorreo()%></td>      
                                        <td><%=usu.getContrasenia()%></td>      
                                        <td><%=usu.getRol()%></td>      
                                        <td>
                                            <div class="row">
                                                <div class="col-sm-6">

                                                    <form action="servletEliminarUsuario" method="POST">
                                                        <p><input type="hidden" name="id" value="<%=usu.getId()%>"></p>
                                                        <button type="submit" class="btn btn-outline-danger" style="margin:10px">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-lg" viewBox="0 0 16 16">
                                                            <path d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8z"/>
                                                            </svg>
                                                        </button>
                                                    </form>
                                                </div>
                                                <div class="col-sm-6">
                                                    <form action="servletEditarUsuario" method="GET">
                                                        <p><input type="hidden" name="id" value="<%=usu.getId()%>"></p>
                                                        <button type="submit" class="btn btn-outline-success" style="margin:10px">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16">
                                                            <path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325"/>
                                                            </svg>
                                                        </button>
                                                    </form>
                                                </div>

                                            </div>
                                        </td>

                                    </tr>
                                    <%
                                        }
                                    %>
                                    <tr>
                                        <td style="text-align: center;">
                                            <a class="btn-outline-sucess"href="altaPacientes.jsp">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-plus-square" viewBox="0 0 16 16">
                                                <path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2z"/>
                                                <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4"/>
                                                </svg>
                                            </a>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </main>
            <%@include file="layout/footer.jsp" %>
        </div>
    </div>
    <%@include file="layout/scripts.jsp" %>
</body>
</html>

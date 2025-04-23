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
                                        <th>Fecha Prestamo</th>
                                        <th>Fecha Devolución</th> 
                                        <th>Usuario</th>
                                        <th>Libro</th>
                                        <th>Estado</th>
                                        <th>Opciones</th>
                                    </tr>
                                </thead>
                                <tbody>                             
                                    <%                                        controladora control = new controladora();
                                        List<prestamos> listaPrestamos = control.traerPrestamos();
                                        for (prestamos prestamo : listaPrestamos) {
                                    %>
                                    <tr>
                                        <td><%=prestamo.getId()%></td>
                                        <td><%=prestamo.getFecha_prestamo()%></td>                            
                                        <td><%=prestamo.getFecha_devolucion()%></td>
                                        <td><%=prestamo.getUnUsuario().getNombre()%></td>
                                        <td><%=prestamo.getUnLibro().getTitulo()%></td>      
                                        <td><%=prestamo.getEstado()%></td>      
                                        <td>

                                            <div class="container-fluid d-flex justify-content-center align-items-center h-100" >
                                                <div class="row">
                                                    <div class="col-sm-6">
                                                        <form action="servletDevolverPrestamo" method="POST">
                                                            <p><input type="hidden" name="id" value="<%=prestamo.getId()%>"></p>
                                                            <button type="submit" class="btn btn-outline-success" style="margin:10px">
                                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-box-arrow-down" viewBox="0 0 16 16">
                                                                <path fill-rule="evenodd" d="M3.5 10a.5.5 0 0 1-.5-.5v-8a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 .5.5v8a.5.5 0 0 1-.5.5h-2a.5.5 0 0 0 0 1h2A1.5 1.5 0 0 0 14 9.5v-8A1.5 1.5 0 0 0 12.5 0h-9A1.5 1.5 0 0 0 2 1.5v8A1.5 1.5 0 0 0 3.5 11h2a.5.5 0 0 0 0-1z"/>
                                                                <path fill-rule="evenodd" d="M7.646 15.854a.5.5 0 0 0 .708 0l3-3a.5.5 0 0 0-.708-.708L8.5 14.293V5.5a.5.5 0 0 0-1 0v8.793l-2.146-2.147a.5.5 0 0 0-.708.708z"/>
                                                                </svg>
                                                            </button>
                                                        </form>
                                                    </div>
                                                </div>
                                                <div class="container-fluid d-flex justify-content-center align-items-center h-100" >
                                                    <div class="row">
                                                        <div class="col-sm-6">
                                                            <form action="servletNoDevuelto" method="POST">
                                                                <p><input type="hidden" name="id" value="<%=prestamo.getId()%>"></p>
                                                                <button type="submit" class="btn btn-outline-success" style="margin:10px">
                                                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-exclamation-octagon" viewBox="0 0 16 16">
                                                                    <path d="M4.54.146A.5.5 0 0 1 4.893 0h6.214a.5.5 0 0 1 .353.146l4.394 4.394a.5.5 0 0 1 .146.353v6.214a.5.5 0 0 1-.146.353l-4.394 4.394a.5.5 0 0 1-.353.146H4.893a.5.5 0 0 1-.353-.146L.146 11.46A.5.5 0 0 1 0 11.107V4.893a.5.5 0 0 1 .146-.353zM5.1 1 1 5.1v5.8L5.1 15h5.8l4.1-4.1V5.1L10.9 1z"/>
                                                                    <path d="M7.002 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0M7.1 4.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0z"/>
                                                                    </svg>
                                                                </button>
                                                            </form>
                                                        </div>
                                                    </div>
                                                    <%
                                                        }
                                                    %>
                                                </div>
                                            </div>
                                        </td>

                                    </tr>
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

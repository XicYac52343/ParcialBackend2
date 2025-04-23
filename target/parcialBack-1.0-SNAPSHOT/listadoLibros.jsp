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
                    <%                        
                        Integer fallo = (Integer) request.getSession().getAttribute("falloPrestamo");
                        if (fallo != null) {
                            if (fallo == 1) {
                    %>
                    <div class="alert alert-danger">
                        <strong>NO </strong> Disponible
                    </div>
                    <%
                            }
                        }
                    %>
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
                                        <th>ISBN</th>
                                        <th>Título</th> 
                                        <th>Autor</th>
                                        <th>Año</th>
                                        <th>Género</th>
                                        <th>Disponibilidad</th>
                                        <th>Opciones</th>
                                    </tr>
                                </thead>
                                <tbody>                             
                                    <%                                        controladora control = new controladora();
                                        List<libros> listaLibros = control.traerLibros();
                                        for (libros libro : listaLibros) {
                                    %>
                                    <tr>
                                        <td><%=libro.getId()%></td>
                                        <td><%=libro.getIsbn()%></td>                            
                                        <td><%=libro.getTitulo()%></td>
                                        <td><%=libro.getAutor()%></td>      
                                        <td><%=libro.getAnio()%></td>      
                                        <td><%=libro.getGenero()%></td>      
                                        <td><%=libro.isDisponibilidad()%></td>  

                                        <td>
                                            <div class="container-fluid d-flex justify-content-center align-items-center h-100" >
                                                <%
                                                    if (rol != null) {
                                                        if (rol.getRol().equals("admin")) {

                                                %>
                                                <div class="row">
                                                    <div class="col-sm-6">
                                                        <form action="servletEditarLibro" method="GET">
                                                            <p><input type="hidden" name="id" value="<%=libro.getId()%>"></p>
                                                            <button type="submit" class="btn btn-outline-success" style="margin:10px">
                                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16">
                                                                <path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325"/>
                                                                </svg>
                                                            </button>
                                                        </form>
                                                    </div>

                                                </div>
                                                <%                                }
                                                    }
                                                %>

                                                <%
                                                    if (rol != null) {
                                                        if (rol.getRol().equals("estandar")) {

                                                %>
                                                <div class="row">
                                                    <div class="col-sm-6">
                                                        <form action="servletSolicitarPrestamo" method="POST">
                                                            <p><input type="hidden" name="id" value="<%=libro.getId()%>"></p>
                                                            <button type="submit" class="btn btn-outline-success" style="margin:10px">
                                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bag-plus" viewBox="0 0 16 16">
                                                                <path fill-rule="evenodd" d="M8 7.5a.5.5 0 0 1 .5.5v1.5H10a.5.5 0 0 1 0 1H8.5V12a.5.5 0 0 1-1 0v-1.5H6a.5.5 0 0 1 0-1h1.5V8a.5.5 0 0 1 .5-.5"/>
                                                                <path d="M8 1a2.5 2.5 0 0 1 2.5 2.5V4h-5v-.5A2.5 2.5 0 0 1 8 1m3.5 3v-.5a3.5 3.5 0 1 0-7 0V4H1v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V4zM2 5h12v9a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1z"/>
                                                                </svg>
                                                            </button>
                                                        </form>
                                                    </div>
                                                </div>
                                                <%                                }
                                                    }
                                                %>
                                            </div>
                                        </td>

                                    </tr>
                                    <%
                                        }
                                    %>
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

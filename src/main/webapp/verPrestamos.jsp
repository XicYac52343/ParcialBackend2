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
                                        <th>Libro</th>
                                        <th>Estado</th>
                                        <th>Opciones</th>
                                    </tr>
                                </thead>
                                <tbody>                             
                                    <%                                        
                                        controladora control = new controladora();
                                        usuarios usu = (usuarios) request.getSession().getAttribute("infoUsuario");
                                        List<prestamos> listaPrestamos = control.traerPrestamosPersona(usu);
                                        for (prestamos prestamo : listaPrestamos) {
                                    %>
                                    <tr>
                                        <td><%=prestamo.getId()%></td>
                                        <td><%=prestamo.getFecha_prestamo()%></td>                            
                                        <td><%=prestamo.getFecha_devolucion()%></td>
                                        <td><%=prestamo.getUnLibro().getTitulo()%></td>      
                                        <td><%=prestamo.getEstado()%></td>      
                                        <td>
                                            <div class="container-fluid d-flex justify-content-center align-items-center h-100" >
                                                <div class="row">
                                                    <div class="col-sm-6">
                                                        <form action="servletDevolverPrestamo" method="POST">
                                                            <p><input type="hidden" name="id" value="<%=prestamo.getId()%>"></p>
                                                            <button type="submit" class="btn btn-outline-success" style="margin:10px">
                                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bag-plus" viewBox="0 0 16 16">
                                                                <path fill-rule="evenodd" d="M8 7.5a.5.5 0 0 1 .5.5v1.5H10a.5.5 0 0 1 0 1H8.5V12a.5.5 0 0 1-1 0v-1.5H6a.5.5 0 0 1 0-1h1.5V8a.5.5 0 0 1 .5-.5"/>
                                                                <path d="M8 1a2.5 2.5 0 0 1 2.5 2.5V4h-5v-.5A2.5 2.5 0 0 1 8 1m3.5 3v-.5a3.5 3.5 0 1 0-7 0V4H1v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V4zM2 5h12v9a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1z"/>
                                                                </svg>
                                                            </button>
                                                        </form>
                                                    </div>
                                                </div>
                                                <%                                
                                                    }
                                                %>
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

<%@page import="logica.usuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<div id="layoutSidenav_nav">
    <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
        <div class="sb-sidenav-menu">
            <div class="nav">
                <a class="nav-link" href="index.html">
                    <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                    Menú
                </a>
                <div class="sb-sidenav-menu-heading">Gestión</div>

                <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseUsuario" aria-expanded="false" aria-controls="collapseLayouts">
                    <div class="sb-nav-link-icon"><i class="fas fa-solid fa-user-dootor"></i></div>
                    Usuario
                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                </a>
                <div class="collapse" id="collapseUsuario" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                    <nav class="sb-sidenav-menu-nested nav">
                        <a class="nav-link" href="servletEditarInfo">Ver Información Personal</a>
                    </nav>
                </div>


                <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLibros" aria-expanded="false" aria-controls="collapsePages">
                    <div class="sb-nav-link-icon"><i class="fas fa-solid fa-person"></i></div>
                    Libros
                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                </a>
                <div class="collapse" id="collapseLibros" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                    <nav class="sb-sidenav-menu-nested nav">
                        <%
                            usuarios rol = (usuarios) request.getSession().getAttribute("infoUsuario");
                            if (rol != null) {
                                if (rol.getRol().equals("admin")) {

                        %>
                        <a class="nav-link" href="crearLibro.jsp" >Crear Libro</a>
                        <%                                }
                            }
                        %>

                        <a class="nav-link" href="listadoLibros.jsp" >Ver Libros</a>

                    </nav>
                </div>

                <%
                    if (rol != null) {
                        if (!rol.getRol().equals("admin")) {

                %>
                <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePrestamos" aria-expanded="false" aria-controls="collapseLayouts">
                    <div class="sb-nav-link-icon"><i class="fas fa-solid fa-user-dootor"></i></div>
                    Préstamos
                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                </a>
                <div class="collapse" id="collapsePrestamos" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                    <nav class="sb-sidenav-menu-nested nav">
                        <a class="nav-link" href="verPrestamos.jsp">Ver Préstamos</a>
                    </nav>
                </div>

                <%                                }
                    }
                %>

                <%if (rol != null) {
                        if (rol.getRol().equals("admin")) {

                %>
                <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseAdmin" aria-expanded="false" aria-controls="collapseLayouts">
                    <div class="sb-nav-link-icon"><i class="fas fa-solid fa-user-dootor"></i></div>
                    Panel de Admin
                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                </a>
                <div class="collapse" id="collapseAdmin" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                    <nav class="sb-sidenav-menu-nested nav">
                        <a class="nav-link" href="verUsuarios.jsp">Gestionar Usuarios</a>
                        <a class="nav-link" href="verPrestamosAdmin.jsp">Gestionar Préstamos</a>
                    </nav>
                </div>
                <%                                }
                    }
                %>
            </div>
        </div>
        <div class="sb-sidenav-footer">
            <div class="small">Iniciando sesión como: </div>
            <%                String nombre = (String) request.getSession().getAttribute("usuario");
            %>
            <%=nombre%>
        </div>
    </nav>
</div>

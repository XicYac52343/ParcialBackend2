<%@page import="logica.libros"%>
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
                <div class="mt-1 m-3">
                    <h2 class="mt-4">Su información</h2>
                    <form action="servletEditarLibro" method="POST">
                        <%                            libros libro = (libros) request.getSession().getAttribute("libroEditar");
                        %>
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <div class="form-floating mb-3 mb-md-0">
                                    <input class="form-control" id="nombre" name="isbn" type="number" value="<%=libro.getIsbn()%>" placeholder="Ingresa tu nombre" />
                                    <label for="inputFirstName">ISBN</label>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-floating">
                                    <input class="form-control" id="apellido" name="titulo" type="text" value="<%=libro.getTitulo()%>" placeholder="Ingresa tu apellido" />
                                    <label for="inputLastName">titulo</label>
                                </div>
                            </div>
                            <div class="form-floating mb-3">
                                <input class="form-control" id="autorl" name="autor" type="text" value="<%=libro.getAutor()%>" placeholder="name@ejemplo.com" />
                                <label for="inputEmail">autor</label>
                            </div>
                            <div class="form-floating mb-3">
                                <input class="form-control" id="autorl" name="anio" type="text" value="<%=libro.getAnio()%>" placeholder="name@ejemplo.com" />
                                <label for="inputEmail">Año</label>
                            </div>
                            <div class="form-floating mb-3">
                                <input class="form-control" id="autorl" name="genero" type="text" value="<%=libro.getGenero()%>" placeholder="name@ejemplo.com" />
                                <label for="inputEmail">Género</label>
                            </div>
                            <h5>Disponibilidad:</h5>
                            <div class="form-check">
                                <input type="radio" class="form-check-input" id="rol" name="disponibilidad" value="true" checked>
                                <label class="form-check-label" for="radio1">Disponible</label>
                            </div>
                            <div class="form-check">
                                <input type="radio" class="form-check-input" id="rol" name="disponibilidad" value="false" checked>
                                <label class="form-check-label" for="radio1">No disponible</label>
                            </div>
                        </div>
                        <div class="mt-4 mb-0">
                            <button class="btn-primary btn-block" type="submit">Guardar Info</button>
                        </div>
                    </form>
            </main>
            <%@include file="layout/footer.jsp" %>
        </div>
    </div>
    <%@include file="layout/scripts.jsp" %>
</body>
</html>
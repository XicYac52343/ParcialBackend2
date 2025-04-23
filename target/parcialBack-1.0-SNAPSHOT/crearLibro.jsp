|<%@ page contentType="text/html" pageEncoding="UTF-8"%>

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
                        <h2 class="mt-4">Crear Libro</h2>
                        <p>Por favor, completa la siguiente información:</p>
                        <form action="servletLibro" method="POST">
                            <div class="row mb-3">
                                <div class="col">
                                    <input type="number" class="form-control" placeholder="Ingrese el ISBN" name="isbn" required> 
                                </div>
                                <div class="col">
                                    <input type="text" class="form-control" placeholder="Ingrese el titulo" name="titulo" required> 
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col">
                                    <input type="text" class="form-control" placeholder="Ingresa el autor" name="autor" required>
                                </div>
                                <div class="col">
                                    <input type="text" class="form-control" placeholder="Ingresa el año" name="anio" required>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col">
                                    <input type="text" class="form-control" placeholder="Ingrese el genero" name="genero" required>
                                </div>
                                <button type="submit" class="btn btn-success">Añadir</button>
                            </div>
                        </form>
                            </main>
            <%@include file="layout/footer.jsp" %>
        </div>
    </div>
    <%@include file="layout/scripts.jsp" %>
</body>
</html>
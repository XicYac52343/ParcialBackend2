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
                    <form action="servletEditarUsuario" method="POST">
                        <%                            usuarios usu = (usuarios) request.getSession().getAttribute("usuarioEditarA");
                        %>
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <div class="form-floating mb-3 mb-md-0">
                                    <input class="form-control" id="nombre" name="nombre" type="text" value="<%=usu.getNombre()%>" placeholder="Ingresa tu nombre" />
                                    <label for="inputFirstName">Nombre</label>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-floating">
                                    <input class="form-control" id="apellido" name="apellido" type="text" value="<%=usu.getApellido()%>" placeholder="Ingresa tu apellido" />
                                    <label for="inputLastName">Apellido</label>
                                </div>
                            </div>
                            <div class="form-floating mb-3">
                                <input class="form-control" id="inputEmail" name="correo" type="email" value="<%=usu.getCorreo()%>" placeholder="name@ejemplo.com" />
                                <label for="inputEmail">Correo</label>
                            </div>
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <div class="form-floating mb-3 mb-md-0">
                                        <input class="form-control" id="inputPassword" name="contrasenia" type="password" value="<%=usu.getContrasenia()%>" placeholder="Crear una contraseÃ±a" />
                                        <label for="inputPassword">Contraseña</label>
                                    </div>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <div class="form-floating mb-3 mb-md-0">
                                        <input class="form-control" id="inputPassword" name="rol" type="text" value="<%=usu.getRol()%>" placeholder="Crear una contraseÃ±a" />
                                        <label for="inputPassword">Rol</label>
                                    </div>
                                </div>
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
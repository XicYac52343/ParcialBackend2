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
                <div class="container-fluid px-4">
                    <h1 class="mt-4">Biblioteca </h1>
                    <div class="card mb-4">
                        <div class="card-header">
                            La mejor biblioteca a tu servicio
                        </div>
                        <div class="card-body">
                            <center>
                                <img src="img/libroWall.jpeg" class="card-img" alt="alt" style="width: 100%"/>
                            </center>
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

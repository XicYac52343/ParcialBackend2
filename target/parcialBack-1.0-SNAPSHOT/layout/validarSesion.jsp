<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String usuarioLoggeado = (String) request.getSession().getAttribute("usuarioLoggeado");
    
    if(usuarioLoggeado == null){
        response.sendRedirect("login.jsp");
    }
%>
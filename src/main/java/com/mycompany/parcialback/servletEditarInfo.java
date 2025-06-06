package com.mycompany.parcialback;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.controladora;
import logica.usuarios;


@WebServlet(name = "servletEditarInfo", urlPatterns = {"/servletEditarInfo"})
public class servletEditarInfo extends HttpServlet {
    controladora control = new controladora();


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet servletEditarInfo</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet servletEditarInfo at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        usuarios idUsuario = (usuarios) request.getSession().getAttribute("infoUsuario");
        usuarios usu = control.traerUsuario(idUsuario.getId());
        
        HttpSession misession = request.getSession();
        misession.setAttribute("usuarioEditar", usu);
        
        response.sendRedirect("verInfoUsuario.jsp");
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        usuarios usu = (usuarios) request.getSession().getAttribute("usuarioEditar");
        
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String correo = request.getParameter("correo");
        String contrasenia = request.getParameter("contrasenia");
        
        usu.setNombre(nombre);
        usu.setApellido(apellido);
        usu.setCorreo(correo);
        usu.setContrasenia(contrasenia);
        
        control.editarUsuario(usu);
        response.sendRedirect("index.jsp");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

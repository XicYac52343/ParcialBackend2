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
import logica.libros;
import logica.usuarios;


@WebServlet(name = "servletSolicitarPrestamo", urlPatterns = {"/servletSolicitarPrestamo"})
public class servletSolicitarPrestamo extends HttpServlet {
    controladora control = new controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet servletSolicitarPrestamo</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet servletSolicitarPrestamo at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int idLibro = Integer.parseInt(request.getParameter("id"));
        libros libro = control.traerLibro(idLibro);
        HttpSession misession = request.getSession();
        usuarios usu = (usuarios) request.getSession().getAttribute("infoUsuario");
        
        if(libro.isDisponibilidad()==true){
            libro.setDisponibilidad(false);
            control.editarLibro(libro);
            control.crearPrestamo(libro, usu);
            response.sendRedirect("listadoLibros.jsp");
            
        }else{
            misession.setAttribute("falloPrestamo", 1);
            response.sendRedirect("listadoLibros.jsp");
        }
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

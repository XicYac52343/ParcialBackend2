package com.mycompany.parcialback;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.controladora;
import logica.libros;
import logica.prestamos;

@WebServlet(name = "servletDevolverPrestamo", urlPatterns = {"/servletDevolverPrestamo"})
public class servletDevolverPrestamo extends HttpServlet {

    controladora control = new controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet servletDevolverPrestamo</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet servletDevolverPrestamo at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int idPrestamo = Integer.parseInt(request.getParameter("id"));
        prestamos prestamo = control.traerPrestamo(idPrestamo);

        prestamo.setEstado("devuelto");
        prestamo.getUnLibro().setDisponibilidad(false);
        libros libro = prestamo.getUnLibro();

        libro.setDisponibilidad(true);
        control.editarLibro(libro);
        control.editarPrestamo(prestamo);

        response.sendRedirect("index.jsp");

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

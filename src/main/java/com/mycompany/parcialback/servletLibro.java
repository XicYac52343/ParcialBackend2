package com.mycompany.parcialback;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.controladora;
import logica.libros;


@WebServlet(name = "servletLibro", urlPatterns = {"/servletLibro"})
public class servletLibro extends HttpServlet {
    controladora control = new controladora();


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet servletLibro</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet servletLibro at " + request.getContextPath() + "</h1>");
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
        int isbn = Integer.parseInt(request.getParameter("isbn"));
        String titulo = request.getParameter("titulo");
        String autor = request.getParameter("autor");
        String anio =request.getParameter("anio");
        String genero = request.getParameter("genero");
        
        libros libro = new libros();
        libro.setIsbn(isbn);
        libro.setTitulo(titulo);
        libro.setAutor(autor);
        libro.setAnio(anio);
        libro.setGenero(genero);
        libro.setDisponibilidad(true);
        
        control.crearLibro(libro);
        
        response.sendRedirect("crearLibro.jsp");
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

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


@WebServlet(name = "servletEditarLibro", urlPatterns = {"/servletEditarLibro"})
public class servletEditarLibro extends HttpServlet {
    controladora control = new controladora();


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet servletEditarLibro</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet servletEditarLibro at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int idLibro = Integer.parseInt(request.getParameter("id"));
        libros libro = control.traerLibro(idLibro);
        
        HttpSession misession = request.getSession();
        misession.setAttribute("libroEditar", libro);
        
        response.sendRedirect("editarLibro.jsp");
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int isbn = Integer.parseInt(request.getParameter("isbn"));
        String titulo = request.getParameter("titulo");
        String autor = request.getParameter("autor");
        String anio = request.getParameter("anio");
        String genero = request.getParameter("genero");
        boolean disponibilidad = Boolean.parseBoolean(request.getParameter("disponibilidad"));
        
        libros libro = (libros) request.getSession().getAttribute("libroEditar");
        libro.setIsbn(isbn);
        libro.setTitulo(titulo);
        libro.setAutor(autor);
        libro.setAnio(anio);
        libro.setGenero(genero);
        libro.setDisponibilidad(disponibilidad);
        
        control.editarLibro(libro);
        
        response.sendRedirect("listadoLibros.jsp");
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

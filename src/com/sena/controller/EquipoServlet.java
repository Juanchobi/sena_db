package com.sena.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sena.dao.EquipoDAO;
import com.sena.model.Equipo;

@WebServlet("/EquipoServlet")
public class EquipoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // 1. Recibir datos del formulario JSP
        String nombre = request.getParameter("nombre");
        String marca = request.getParameter("marca");

        // 2. Crear el objeto y usar el DAO que ya tenías
        Equipo nuevoEquipo = new Equipo();
        nuevoEquipo.setNombre(nombre);
        nuevoEquipo.setMarca(marca);
        nuevoEquipo.setEstado("Activo");

        EquipoDAO dao = new EquipoDAO();
        dao.crear(nuevoEquipo);

        // 3. Respuesta al navegador
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        out.println("<h2>Registro exitoso en sena_db</h2>");
        out.println("<p>El equipo " + nombre + " ha sido guardado.</p>");
        out.println("<a href='index.jsp'>Volver al formulario</a>");
        out.println("</body></html>");
    }
}
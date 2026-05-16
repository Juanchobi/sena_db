package com.sena.controller;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet(name = "UsuarioServlet", urlPatterns = {"/UsuarioServlet"})
public class UsuarioServlet extends HttpServlet {

    // Configuración de conexión (Asegúrate de que el puerto sea 3307 como en tu phpMyAdmin)
    private final String url = "jdbc:mysql://localhost:3307/sena_db?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true";
    private final String userDB = "root";
    private final String passDB = "";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        String accion = request.getParameter("accion");

        if (accion == null) {
            response.sendRedirect("index.jsp");
            return;
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            if ("login".equals(accion)) {
                procesarLogin(request, response);
            } else if ("registrar".equals(accion)) {
                procesarRegistro(request, response);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("index.jsp?error=db_error");
        }
    }

    // --- LÓGICA DE INICIO DE SESIÓN ---
    private void procesarLogin(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String userParam = request.getParameter("username"); 
        String passParam = request.getParameter("password");

        try (Connection con = DriverManager.getConnection(url, userDB, passDB)) {
            // Incluimos ID en el SELECT para que no falle al guardarlo en sesión
            String sql = "SELECT id, nombre, rol FROM usuarios WHERE username=? AND password=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, userParam);
            ps.setString(2, passParam);
            
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    HttpSession sesion = request.getSession(true);
                    // Guardamos los datos que usas en tus otros JSPs
                    sesion.setAttribute("nombreUsuario", rs.getString("nombre"));
                    sesion.setAttribute("rolUsuario", rs.getString("rol"));
                    sesion.setAttribute("idUsuario", rs.getInt("id")); 
                    
                    response.sendRedirect("principal.jsp");
                } else {
                    // Si no hay coincidencia, regresa al login con error
                    response.sendRedirect("index.jsp?error=1");
                }
            }
        }
    }

    // --- LÓGICA DE REGISTRO DE NUEVOS USUARIOS ---
    private void procesarRegistro(HttpServletRequest request, HttpServletResponse response) throws Exception {
        try (Connection con = DriverManager.getConnection(url, userDB, passDB)) {
            // SQL alineado exactamente con la estructura de tu imagen de phpMyAdmin
            String sql = "INSERT INTO usuarios (cargo, cedula, codigo_empleado, correo, nombre, password, rol, username) VALUES (?,?,?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            
            ps.setString(1, request.getParameter("cargo"));
            ps.setString(2, request.getParameter("cedula"));
            ps.setString(3, request.getParameter("codigo_empleado"));
            ps.setString(4, request.getParameter("correo"));
            ps.setString(5, request.getParameter("nombre"));
            ps.setString(6, request.getParameter("password"));
            ps.setString(7, request.getParameter("rol"));
            ps.setString(8, request.getParameter("username"));
            
            ps.executeUpdate();
            
            // Mensaje de confirmación para el administrador
            request.getSession().setAttribute("mensaje", "Usuario registrado correctamente.");
            response.sendRedirect("crear_usuario.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}   
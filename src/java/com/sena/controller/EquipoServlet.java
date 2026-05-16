package com.sena.controller;

import com.sena.model.Equipo;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet(name = "EquipoServlet", urlPatterns = {"/EquipoServlet"})
public class EquipoServlet extends HttpServlet {

    // AJUSTA ESTO A TU CONFIGURACIÓN (Puerto y Nombre de DB)
    private final String URL = "jdbc:mysql://localhost:3307/sena_db?serverTimezone=UTC";
    private final String USER = "root";
    private final String PASS = "";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String accion = request.getParameter("accion");
        if (accion == null) accion = "listar";

        try (Connection con = DriverManager.getConnection(URL, USER, PASS)) {
            Class.forName("com.mysql.cj.jdbc.Driver");

            switch (accion) {
                case "listar":
                    List<Equipo> lista = new ArrayList<>();
                    String sqlListar = "SELECT * FROM equipos";
                    try (PreparedStatement ps = con.prepareStatement(sqlListar); 
                         ResultSet rs = ps.executeQuery()) {
                        while (rs.next()) {
                            Equipo e = new Equipo();
                            e.setId(rs.getInt("id"));
                            e.setNombre(rs.getString("nombre"));
                            e.setMarca(rs.getString("marca"));
                            e.setModelo(rs.getString("modelo"));
                            e.setPlaca_inventario(rs.getString("placa_inventario"));
                            e.setEstado_energia(rs.getString("estado_energia"));
                            lista.add(e);
                        }
                    }
                    request.setAttribute("equipos", lista);
                    request.getRequestDispatcher("inventario.jsp").forward(request, response);
                    break;

                case "ver":
                case "editar":
                case "salud":
                    int id = Integer.parseInt(request.getParameter("id"));
                    Equipo equipo = buscarPorId(id, con);
                    request.setAttribute("equipo", equipo);
                    request.setAttribute("modo", accion);
                    
                    // Si es salud, va a salud_equipo.jsp, sino a registro_detalle.jsp
                    String destino = accion.equals("salud") ? "salud_equipo.jsp" : "registro_detalle.jsp";
                    request.getRequestDispatcher(destino).forward(request, response);
                    break;

                case "eliminar":
                    int idEliminar = Integer.parseInt(request.getParameter("id"));
                    try (PreparedStatement ps = con.prepareStatement("DELETE FROM equipos WHERE id = ?")) {
                        ps.setInt(1, idEliminar);
                        ps.executeUpdate();
                    }
                    response.sendRedirect("EquipoServlet?accion=listar");
                    break;
                    
                case "nuevaFicha":
                    request.setAttribute("modo", "nuevo");
                    request.setAttribute("equipo", new Equipo());
                    request.getRequestDispatcher("registro_detalle.jsp").forward(request, response);
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().print("Error: " + e.getMessage());
        }
    }

    private Equipo buscarPorId(int id, Connection con) throws SQLException {
        String sql = "SELECT * FROM equipos WHERE id = ?";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Equipo e = new Equipo();
                    e.setId(rs.getInt("id"));
                    e.setNombre(rs.getString("nombre"));
                    e.setMarca(rs.getString("marca"));
                    e.setModelo(rs.getString("modelo"));
                    e.setSerial(rs.getString("serial"));
                    e.setPlaca_inventario(rs.getString("placa_inventario"));
                    e.setFechacompra(rs.getString("fechaCompra"));
                    e.setEstado_energia(rs.getString("estado_energia"));
                   
                    return e;
                }
            }
        }
        return null;
    }

    @Override protected void doGet(HttpServletRequest r, HttpServletResponse s) throws ServletException, IOException { processRequest(r, s); }
    @Override protected void doPost(HttpServletRequest r, HttpServletResponse s) throws ServletException, IOException { processRequest(r, s); }
}
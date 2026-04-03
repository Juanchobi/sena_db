package com.sena.dao;
import com.sena.model.Equipo;
import java.sql.*;

public class EquipoDAO {
    Conexion conectar = new Conexion();
    Connection con;
    PreparedStatement ps;

    public void crear(Equipo eq) {
        String sql = "INSERT INTO equipos (nombre, marca, estado) VALUES (?, ?, ?)";
        try {
            con = conectar.getConexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, eq.getNombre());
            ps.setString(2, eq.getMarca());
            ps.setString(3, eq.getEstado());
            ps.executeUpdate();
        } catch (Exception e) { System.out.println(e); }
    }
}
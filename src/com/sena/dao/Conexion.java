package com.sena.dao;
import java.sql.*;

public class Conexion {
    private String url = "jdbc:mysql://localhost:3307/sena_db";
    private String user = "root";
    private String pass = ""; 

    public Connection getConexion() {
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(url, user, pass);
        } catch (Exception e) {
            System.out.println("Error de conexión: " + e.getMessage());
        }
        return con;
    }
}
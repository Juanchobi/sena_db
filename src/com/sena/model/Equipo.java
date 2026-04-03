package com.sena.model;

public class Equipo {
    private int id;
    private String nombre;
    private String marca;
    private String estado;

    public Equipo() {}

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }
    public String getMarca() { return marca; }
    public void setMarca(String marca) { this.marca = marca; }
    public String getEstado() { return estado; }
    public void setEstado(String estado) { this.estado = estado; }
}
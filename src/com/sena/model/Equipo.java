package com.sena.controlador; // Importante que coincida con tu paquete

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

public class Equipo {
    private String categoria; // "PC" o "Pieza"
    private String tipo;      // "Laptop" o "Desktop"
    private String serial;
    private LocalDate fechaCompra;

    // Constructor vacío (necesario para Java Beans)
    public Equipo() {
    }

    // Lógica de cálculo de vida útil
    public long getMesesRestantes() {
        if (fechaCompra == null || tipo == null) return 0;
        
        int limite = tipo.equalsIgnoreCase("Laptop") ? 48 : 60;
        long mesesUso = ChronoUnit.MONTHS.between(fechaCompra, LocalDate.now());
        long resultado = limite - mesesUso;
        
        return resultado > 0 ? resultado : 0;
    }

    // --- GETTERS Y SETTERS (Indispensables) ---
    public String getCategoria() { return categoria; }
    public void setCategoria(String categoria) { this.categoria = categoria; }

    public String getTipo() { return tipo; }
    public void setTipo(String tipo) { this.tipo = tipo; }

    public String getSerial() { return serial; }
    public void setSerial(String serial) { this.serial = serial; }

    public LocalDate getFechaCompra() { return fechaCompra; }
    public void setFechaCompra(LocalDate fechaCompra) { this.fechaCompra = fechaCompra; }
}
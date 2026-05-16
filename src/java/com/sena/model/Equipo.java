package com.sena.model;

public class Equipo {
    private int id;
    private String nombre;
    private String marca;
    private String modelo;
    private String serial;
    private String placa_inventario;
    private String fechacompra;
    private String estado_energia;
    private String tecnico_asignado;
    
    // ESTAS SON LAS QUE FALTABAN Y CAUSAN EL ERROR:
    private int check_adobe;
    private int check_office;
    private int check_antivirus;
    private int check_navegador;

    public Equipo() {
    }

    // Getters y Setters para las variables viejas
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }
    public String getMarca() { return marca; }
    public void setMarca(String marca) { this.marca = marca; }
    public String getModelo() { return modelo; }
    public void setModelo(String modelo) { this.modelo = modelo; }
    public String getSerial() { return serial; }
    public void setSerial(String serial) { this.serial = serial; }
    public String getPlaca_inventario() { return placa_inventario; }
    public void setPlaca_inventario(String placa_inventario) { this.placa_inventario = placa_inventario; }
    public String getFechacompra() { return fechacompra; }
    public void setFechacompra(String fechacompra) { this.fechacompra = fechacompra; }
    public String getEstado_energia() { return estado_energia; }
    public void setEstado_energia(String estado_energia) { this.estado_energia = estado_energia; }
    public String getTecnico_asignado() { return tecnico_asignado; }
    public void setTecnico_asignado(String tecnico_asignado) { this.tecnico_asignado = tecnico_asignado; }

    // NUEVOS Getters y Setters para los Checkboxes
    public int getCheck_adobe() { return check_adobe; }
    public void setCheck_adobe(int check_adobe) { this.check_adobe = check_adobe; }
    public int getCheck_office() { return check_office; }
    public void setCheck_office(int check_office) { this.check_office = check_office; }
    public int getCheck_antivirus() { return check_antivirus; }
    public void setCheck_antivirus(int check_antivirus) { this.check_antivirus = check_antivirus; }
    public int getCheck_navegador() { return check_navegador; }
    public void setCheck_navegador(int check_navegador) { this.check_navegador = check_navegador; }

    public void setCheck_anydesk(int aInt) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
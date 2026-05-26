package org.levisalazar.model;

public class Clientes {
    
    private long dpi; 
    private String nacionalidad; 
    private String telefono; 

    public Clientes() {
    }

    public Clientes(long dpi, String nacionalidad, String telefono) {
        this.dpi = dpi;
        this.nacionalidad = nacionalidad;
        this.telefono = telefono;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public long getDpi() {
        return dpi;
    }

    public void setDpi(long dpi) {
        this.dpi = dpi;
    }

    public String getNacionalidad() {
        return nacionalidad;
    }

    public void setNacionalidad(String nacionalidad) {
        this.nacionalidad = nacionalidad;
    }
    
    
    
}

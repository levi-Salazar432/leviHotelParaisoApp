package org.levisalazar.model;

public class Clientes {
    
    private long dpi; 
    private String nacionaliad; 
    private String telefono; 

    public Clientes() {
    }

    public Clientes(long dpi, String nacionaliad, String telefono) {
        this.dpi = dpi;
        this.nacionaliad = nacionaliad;
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

    public String getNacionaliad() {
        return nacionaliad;
    }

    public void setNacionalidad(String nacionaliad) {
        this.nacionaliad = nacionaliad;
    }
    
    
    
}

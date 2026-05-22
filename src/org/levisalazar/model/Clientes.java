package org.levisalazar.model;

public class Clientes {
    
    private int dpi; 
    private String nacionaliad; 
    private int telefono; 

    public Clientes() {
    }

    public Clientes(int dpi, String nacionaliad, int telefono) {
        this.dpi = dpi;
        this.nacionaliad = nacionaliad;
        this.telefono = telefono;
    }

    public int getTelefono() {
        return telefono;
    }

    public void setTelefono(int telefono) {
        this.telefono = telefono;
    }

    public int getDpi() {
        return dpi;
    }

    public void setDpi(int dpi) {
        this.dpi = dpi;
    }

    public String getNacionaliad() {
        return nacionaliad;
    }

    public void setNacionaliad(String nacionaliad) {
        this.nacionaliad = nacionaliad;
    }
    
    
    
}

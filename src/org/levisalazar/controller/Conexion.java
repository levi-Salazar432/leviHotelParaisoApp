package org.levisalazar.controller;

import java.sql.Connection; 
import java.sql.DriverManager; 
import java.sql.SQLException; 

public class Conexion {
 private static final String URL = "jdbc:mysql://localhost:3306/hoteldb_in4cm";  
    private static final String USER = "root";  
    private static final String PASSWORD = "admin"; 
    
    public static Connection getConexion() {
        Connection cn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            cn = DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error al conectar a la BD: " + e.getMessage());
        }
        return cn;
    }
}

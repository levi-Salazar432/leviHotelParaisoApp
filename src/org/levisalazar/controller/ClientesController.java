package org.levisalazar.controller;

import java.sql.Connection;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import org.levisalazar.model.Clientes;

public class ClientesController {

    public List<Clientes> listarClientes() {
        List<Clientes> lista = new ArrayList<>();
        String sql = "{call sp_listar_clientes()}"; 
        
        Connection con = null;
        CallableStatement cs = null;
        ResultSet rs = null;

        try {
            con = Conexion.getConexion();
            cs = con.prepareCall(sql);
            rs = cs.executeQuery();

            while (rs.next()) {
                Clientes cliente = new Clientes();
                
                // Usamos los nombres de columnas (o alias) idénticos a tu procedimiento
                cliente.setDpi(rs.getLong("DPI"));
                cliente.setNacionalidad(rs.getString("NACIONALIDAD"));
                cliente.setTelefono(rs.getString("TELEFONO"));
                
                lista.add(cliente);
            }
        } catch (SQLException e) {
            System.out.println("Error al ejecutar el procedimiento de listado: " + e.getMessage());
        } finally {
            // Cerramos todas las conexiones para no saturar MySQL
            try {
                if (rs != null) rs.close();
                if (cs != null) cs.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                System.out.println("Error al cerrar los flujos de conexión: " + e.getMessage());
            }
        }
        return lista;
    }
}

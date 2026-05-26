package org.levisalazar.view;

import java.util.List;
import java.util.Scanner;
import org.levisalazar.controller.ClientesController;
import org.levisalazar.model.Clientes; 


public class MenuPrincipal {

    private final Scanner leer = new Scanner(System.in);
    private ClientesController clientesController = new ClientesController();

    public void iniciarSistema() {

        int opcion;

        do {
            System.out.println("---------------------------------------------");
            System.out.println("        Sistema central HOTEL PARAISO        ");
            System.out.println("---------------------------------------------");
            System.out.println("1. Entrar a CLIENTES.");
            System.out.println("4. Salir del sistema.");
            System.out.println("---------------------------------------------");
            System.out.print("Seleccione una opcion: ");
            
            opcion = Integer.parseInt(leer.nextLine());

            switch (opcion) {

                case 1:
                    mostrarClientes(); 
                    break;

                case 4:
                    System.out.println("\nHasta la próxima.");
                    break;

                default:
                    System.out.println("No existe la opción.");
            }

        } while (opcion != 4);
    }    
    private void mostrarClientes() {
        System.out.println("\n==================== LISTADO DE CLIENTES (MySQL) ====================");
        List<Clientes> listaDeBD = clientesController.listarClientes();
        
        if (listaDeBD.isEmpty()) {
            System.out.println("No existen registros en la tabla o no hay conexión.");
        } else {
            // Máscara de espaciado (%-15s) para ordenar la consola en forma de columnas cuadradas
            System.out.printf("%-15s | %-20s | %-12s\n", "DPI", "NACIONALIDAD", "TELÉFONO");
            System.out.println("--------------------------------------------------------------------");
            
            for (Clientes cli : listaDeBD) {
                // Impresión iterativa de las propiedades del objeto de tipo Clientes
                System.out.printf("%-15d | %-20s | %-12s\n", 
                        cli.getDpi(), 
                        cli.getNacionalidad(), 
                        cli.getTelefono());
            }
        }
        System.out.println("====================================================================\n");
    }
}
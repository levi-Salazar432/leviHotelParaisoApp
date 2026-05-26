package org.levisalazar.view;

import java.util.Scanner;

public class MenuPrincipal {

    private final Scanner leer = new Scanner(System.in);

    public void iniciarSistema() {

        int opcion;

        do {
            System.out.println("---------------------------------------------");
            System.out.println("        Sistema central HOTEL PARAISO        ");
            System.out.println("---------------------------------------------");
            System.out.println("1. Entrar a CLIENTES.");
            System.out.println("4. Salir del sistema.");
            System.out.println("---------------------------------------------");

            opcion = Integer.parseInt(leer.nextLine());

            switch (opcion) {

                case 1:
                    System.out.println("CATEGORIAS");
                    break;

                case 4:
                    System.out.println("\nHasta la próxima.");
                    break;

                default:
                    System.out.println("No existe la opción.");
            }

        } while (opcion != 4)                ;
    }
}

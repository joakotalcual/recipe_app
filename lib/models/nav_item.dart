import 'package:flutter/material.dart';
import 'package:recipe/screens/home/home_screen.dart';
import 'package:recipe/screens/profile/profile_screen.dart';

// Clase NavItem que representa un elemento de navegación en la barra de navegación inferior
class NavItem {
  final int id; // Identificador del elemento
  final String icon; // Icono del elemento
  final Widget destination; // Destino del elemento

  NavItem({required this.id, required this.icon, this.destination = const NoFound()}); // Constructor

  // Método para verificar si hay un destino válido para el elemento
  bool destinationChecker() {
    if (destination != null) { // Si hay un destino
      return true; // Devolver verdadero
    }
    return false; // De lo contrario, devolver falso
  }
}

// Clase NavItems que gestiona los elementos de navegación en la barra de navegación inferior
class NavItems extends ChangeNotifier {
  int selectedIndex = 0; // Índice seleccionado por defecto

  // Método para cambiar el índice de navegación
  void changeNavIndex({required int index}) {
    selectedIndex = index; // Establecer el nuevo índice seleccionado
    notifyListeners(); // Notificar a los widgets que usan el valor que ha cambiado
  }

  // Lista de elementos de navegación
  List<NavItem> items = [
    NavItem(
      id: 1,
      icon: "assets/icons/home.svg",
      destination: HomeScreen(), // Destino: pantalla de inicio
    ),
    NavItem(
      id: 2,
      icon: "assets/icons/list.svg",
    ),
    NavItem(
      id: 3,
      icon: "assets/icons/camera.svg",
    ),
    NavItem(
      id: 4,
      icon: "assets/icons/chef_nav.svg",
    ),
    NavItem(
      id: 5,
      icon: "assets/icons/user.svg",
      destination: const ProfileScreen(), // Destino: pantalla de perfil
    ),
  ];
}

// Clase NoFound que muestra un mensaje de error cuando no se encuentra el destino
class NoFound extends StatelessWidget {
  const NoFound({super.key,});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Center(
        child: Column(
          children: <Widget>[
            const Text(
              "NO FOUND", // Mensaje de error
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()), // Ir a la pantalla de inicio
                );
              },
              child: const Icon(Icons.back_hand), // Icono para volver atrás
            ),
          ],
        ),
      ),
    );
  }
}
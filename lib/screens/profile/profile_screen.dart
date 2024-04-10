// Importación del paquete de Flutter para los widgets de Material Design
import 'package:flutter/material.dart';

// Importación de componentes y constantes necesarios
import 'package:recipe_app/components/my_bottom_nav_bar.dart'; // Importación de la barra de navegación inferior personalizada
import 'package:recipe_app/constants.dart'; // Importación de constantes de la aplicación
import 'package:recipe_app/screens/profile/components/body.dart'; // Importación del cuerpo de la pantalla de perfil
import 'package:recipe_app/size_config.dart'; // Importación de la configuración de tamaño

// Clase StatelessWidget para la pantalla de perfil
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  // Método de construcción de la interfaz de usuario
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar de la pantalla de perfil
      appBar: buildAppBar(),
      // Cuerpo de la pantalla de perfil
      body: const Body(),
      // Barra de navegación inferior personalizada
      bottomNavigationBar: const MyBottomNavBar(),
    );
  }

  // Método para construir la AppBar
  AppBar buildAppBar() {
    return AppBar(
      // Color de fondo de la AppBar
      backgroundColor: kPrimaryColor,
      // Eliminar el botón de retroceso
      leading: SizedBox(),
      // Centrar el título en la AppBar
      centerTitle: true,
      // Título de la AppBar
      title: Text(
        "Profile",
        // Estilo del texto del título
        style: TextStyle(
          color: Colors.white,
          fontSize: SizeConfig.defaultSize * 1.1,
          fontWeight: FontWeight.bold,
        ),
      ),
      // Acciones en la AppBar
      actions: <Widget>[
        // Botón de texto para la opción de edición
        TextButton(
          onPressed: () {},
          // Texto del botón de edición
          child: Text(
            "Edit",
            // Estilo del texto del botón de edición
            style: TextStyle(
              color: Colors.white,
              fontSize: SizeConfig.defaultSize * 1.1,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

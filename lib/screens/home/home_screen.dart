// Importaciones de paquetes de Flutter
import 'package:flutter/material.dart'; // Importación del paquete de Flutter para la interfaz de usuario
import 'package:flutter_svg/svg.dart'; // Importación del paquete de SVG de Flutter
import 'package:recipe/components/my_bottom_nav_bar.dart'; // Importación del componente de barra de navegación inferior personalizada
import 'package:recipe/screens/home/components/body.dart'; // Importación del componente del cuerpo de la pantalla de inicio
import 'package:recipe/size_config.dart'; // Importación de la configuración de tamaño

// Clase StatelessWidget para la pantalla de inicio
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Método de construcción de la interfaz de usuario
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context); // Inicialización de la configuración de tamaño
    return Scaffold(
      // Widget de estructura de la pantalla
      appBar: buildAppBar(), // Barra de aplicaciones personalizada
      body: const Body(), // Cuerpo de la pantalla de inicio
      bottomNavigationBar: const MyBottomNavBar(), // Barra de navegación inferior personalizada
      // No somos capaces de BottomNavigationBar porque el parámetro icono no excepto SVG
      // También usamos Provied para gestionar el estado de nuestra Nav
    );
  }

  // Método para construir la barra de aplicaciones personalizada
  AppBar buildAppBar() {
    return AppBar(
      // Barra de aplicaciones con botón de menú, título centrado y botones de acción
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/menu.svg"), // Icono de menú
        onPressed: () {}, // Acción al presionar el botón de menú
      ),
      // En android en defecto es false
      centerTitle: true, // Título centrado
      title: Image.asset("assets/images/logo.png"), // Imagen del logotipo en el título
      actions: <Widget>[
        // Botones de acción en la barra de aplicaciones
        IconButton(
          icon: SvgPicture.asset("assets/icons/search.svg"), // Icono de búsqueda
          onPressed: () {}, // Acción al presionar el botón de búsqueda
        ),
        SizedBox(
          // Espaciado entre los botones de acción
          width: SizeConfig.defaultSize * 0.5, // Ancho basado en el tamaño de pantalla
        )
      ],
    );
  }
}

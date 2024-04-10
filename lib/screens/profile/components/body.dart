// Importaciones de paquetes de Flutter
import 'package:flutter/material.dart';

// Importaciones de componentes locales
import 'package:recipe_app/screens/profile/components/info.dart'; // Importación del componente de información del perfil
import 'package:recipe_app/screens/profile/components/profile_menu_item.dart'; // Importación del componente de elemento del menú del perfil
import 'package:recipe_app/screens/recipe/add_recipe_screen.dart'; // Importación de la pantalla para agregar recetas
import 'package:recipe_app/size_config.dart'; // Importación de la configuración de tamaño

// Clase StatelessWidget para el cuerpo del perfil
class Body extends StatelessWidget {
  // Constructor de la clase
  const Body({super.key});

  // Método de construcción de la interfaz de usuario
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // Widget de desplazamiento para permitir el desplazamiento vertical
      child: Column(
        children: <Widget>[
          // Información del perfil
          const Info(
            image: "assets/images/pic.png", // Ruta de la imagen del perfil
            name: "Jhon Doe", // Nombre del usuario
            email: "Jhondoe01@gmail.com", // Correo electrónico del usuario
          ),
          SizedBox(height: SizeConfig.defaultSize * 1.5), // Espaciado entre elementos
          // Elemento de menú del perfil para ver recetas guardadas
          ProfileMenuItem(
            iconSrc: "assets/icons/bookmark_fill.svg", // Icono del elemento del menú
            title: "Saved Recipes", // Título del elemento del menú
            press: () async{ // Acción al presionar el elemento del menú
              print("PRESIONE"); // Imprimir mensaje de presión
              await Navigator.push(context, MaterialPageRoute(builder: (context) => const AddRecipe()),); // Navegación a la pantalla de agregar recetas
            },
          ),//HACER EL BACKEND
          // Elemento de menú del perfil para el súper plan
          ProfileMenuItem(
            iconSrc: "assets/icons/chef_color.svg", // Icono del elemento del menú
            title: "Super Plan", // Título del elemento del menú
            press: (){}, // Acción al presionar el elemento del menú
          ),
          // Elemento de menú del perfil para cambiar el idioma
          ProfileMenuItem(
            iconSrc: "assets/icons/language.svg", // Icono del elemento del menú
            title: "Change Language", // Título del elemento del menú
            press: (){}, // Acción al presionar el elemento del menú
          ),
          // Elemento de menú del perfil para obtener ayuda
          ProfileMenuItem(
            iconSrc: "assets/icons/info.svg", // Icono del elemento del menú
            title: "Help", // Título del elemento del menú
            press: (){}, // Acción al presionar el elemento del menú
          ),
        ],
      ),
    );
  }
}

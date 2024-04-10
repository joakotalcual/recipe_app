// Importaciones de paquetes de Flutter
import 'package:flutter/material.dart'; // Importación del paquete de Flutter para la interfaz de usuario
import 'package:recipe_app/constants.dart'; // Importación del archivo de constantes
import 'package:recipe_app/size_config.dart'; // Importación de la configuración de tamaño

// Clase StatefulWidget para las categorías
class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState(); // Crear el estado de las categorías
}

// Clase de estado _CategoriesState
class _CategoriesState extends State<Categories> {
  List<String> categories = ['All', 'Indian', 'Italian', 'Mexican', 'Chinese']; // Lista de categorías
  int selectedIndex = 0; // Índice seleccionado

  // Método de construcción de la interfaz de usuario
  @override
  Widget build(BuildContext context) {
    return Padding(
      // Relleno
      padding: EdgeInsets.symmetric(vertical: SizeConfig.defaultSize * 0.5), // Padding vertical
      child: SizedBox(
        // Espacio limitado
        height: SizeConfig.defaultSize * 2.5, // Altura de la lista
        child: ListView.builder(
          // Constructor de lista
          scrollDirection: Axis.horizontal, // Dirección de desplazamiento
          itemCount: categories.length, // Número de elementos en la lista
          itemBuilder: (context, index) => buildCategoriItem(index), // Constructor de elementos de lista
        ),
      ),
    );
  }

  // Método para construir un elemento de categoría
  Widget buildCategoriItem(int index) {
    return GestureDetector(
      // Detector de gestos
      onTap: () {
        // Acción al tocar
        setState(() {
          // Actualizar el estado
          selectedIndex = index; // Índice seleccionado
        });
      },
      child: Container(
        // Contenedor
        alignment: Alignment.center, // Alineación central
        margin: EdgeInsets.only(left: SizeConfig.defaultSize * 0.5), // Margen izquierdo
        padding: EdgeInsets.symmetric(
          // Relleno simétrico
          horizontal: SizeConfig.defaultSize * 1.4, // Relleno horizontal
          vertical: SizeConfig.defaultSize * 0.5, // Relleno vertical
        ),
        decoration: BoxDecoration(
          // Decoración del contenedor
          color: selectedIndex == index ? Color(0xFFEFF3EE) : Colors.transparent, // Color del contenedor
          borderRadius: BorderRadius.circular(
            // Bordes redondeados
            SizeConfig.defaultSize * 0.8, // Radio de borde
          ),
        ),
        child: Text(
          // Texto del contenedor
          categories[index], // Categoría
          style: TextStyle(
            // Estilo del texto
            color: selectedIndex == index ? kPrimaryColor : Color(0xFFC2C2B5), // Color del texto
            fontWeight: FontWeight.bold, // Peso de la fuente
          ),
        ),
      ),
    );
  }
}

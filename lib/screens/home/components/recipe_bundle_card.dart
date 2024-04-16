// Importaciones de paquetes de Flutter
import 'package:flutter/material.dart'; // Importación del paquete de Flutter para la interfaz de usuario
import 'package:flutter_svg/svg.dart'; // Importación del paquete de SVG de Flutter
import 'package:recipe/models/recipe_bundel.dart'; // Importación del modelo de paquete de recetas
import 'package:recipe/size_config.dart'; // Importación de la configuración de tamaño

// Clase StatelessWidget para la tarjeta de paquete de recetas
class RecipeBundelCard extends StatelessWidget {
  final RecipeBundle? recipeBundle; // Bundle de recetas
  final VoidCallback press; // Acción de presionar

  // Constructor de la clase
  const RecipeBundelCard({required this.recipeBundle, required this.press, super.key});

  // Método de construcción de la interfaz de usuario
  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize; // Tamaño predeterminado del dispositivo
    if (recipeBundle == null) { // Comprobar si el paquete de recetas es nulo
      return const Center(
        child: CircularProgressIndicator(), // Manejo de carga si no hay datos
      );
    }
    return GestureDetector(
      onTap: press, // Acción de presionar
      child: Container(
        // Contenedor de la tarjeta de paquete de recetas
        decoration: BoxDecoration(
          color: recipeBundle!.color, // Color del paquete de recetas
          borderRadius: BorderRadius.circular(defaultSize * 1.8), // Bordes redondeados
        ),
        child: Row(
          // Fila de elementos
          children: <Widget>[
            Expanded(
              // Widget expandido
              child: Padding(
                // Relleno
                padding: EdgeInsets.all(defaultSize * 1.5), // Padding en todos los lados
                child: Column(
                  // Columna de elementos
                  crossAxisAlignment: CrossAxisAlignment.start, // Alineación al principio
                  children: <Widget>[
                    const Spacer(), // Espacio flexible
                    Text(
                      recipeBundle!.title, // Título del paquete de recetas
                      style: TextStyle(
                        fontSize: defaultSize * 0.8, // Tamaño de fuente
                        color: Colors.white, // Color del texto
                      ),
                      maxLines: 2, // Número máximo de líneas
                      overflow: TextOverflow.ellipsis, // Desbordamiento de texto
                    ),
                    SizedBox(height: defaultSize * 0.5), // Espaciado entre elementos
                    Text(
                      recipeBundle!.description, // Descripción del paquete de recetas
                      style: const TextStyle(
                        color: Colors.white54 // Color del texto
                      ),
                      maxLines: 2, // Número máximo de líneas
                      overflow: TextOverflow.ellipsis, // Desbordamiento de texto
                    ),
                    const Spacer(), // Espacio flexible
                    buildInfRow( // Método para construir una fila de información
                      defaultSize,
                      iconSrc: "assets/icons/pot.svg", // Icono de la olla
                      text: "${recipeBundle!.recipes} Recipes" // Texto del número de recetas
                    ),
                    buildInfRow( // Método para construir una fila de información
                      defaultSize,
                      iconSrc: "assets/icons/chef.svg", // Icono del chef
                      text: "${recipeBundle!.chefs} Chefs" // Texto del número de chefs
                    ),
                    const Spacer(), // Espacio flexible
                  ],
                ),
              ),
            ),
            SizedBox(width: defaultSize * 0.5), // Espaciado entre elementos
            AspectRatio( // Widget para mantener la relación de aspecto
              aspectRatio: 0.71, // Relación de aspecto de la imagen
              child: ClipRRect( // Widget para recortar la imagen con bordes redondeados
                borderRadius: const BorderRadius.only( // Define los bordes redondeados en el lado derecho
                  topRight: Radius.circular(20.0), // Radio de curvatura en la esquina superior derecha
                  bottomRight: Radius.circular(20.0), // Radio de curvatura en la esquina inferior derecha
                ),
                child: Image.network( // Widget de imagen cargada desde una URL
                  recipeBundle!.imageSrc, // URL de la imagen en línea
                  fit: BoxFit.cover, // Ajuste de la imagen para cubrir el área disponible
                  loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) { // Constructor de carga de imagen
                    if (loadingProgress == null) { // Si la carga ha finalizado
                      return child; // Retorna la imagen
                    } else { // Si la carga está en progreso
                      return Center( // Centra un indicador de progreso mientras se carga la imagen
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    }
                  },
                  errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) { // Constructor de error de carga de imagen
                    return Tooltip( // Muestra un mensaje de tooltip en caso de error
                      message: 'Failed to load image', // Mensaje del tooltip
                      child: Center( // Centra un icono para indicar el error
                        child: GestureDetector( // Widget para detectar gestos
                          onTap: () { // Cuando se toca el icono de error
                            ScaffoldMessenger.of(context).showSnackBar( // Muestra una barra de snack con un mensaje
                              const SnackBar(
                                content: Text('Failed to load image'), // Contenido del mensaje de error
                              ),
                            );
                          },
                          child: const Icon(Icons.error_outline), // Icono de error
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Método para construir una fila de información
  Row buildInfRow(double defaultSize, {String? iconSrc, text}) {
    return Row(
      // Fila de elementos
      children: <Widget>[
        SvgPicture.asset(iconSrc!), // Icono SVG
        SizedBox(width: defaultSize * 0.5), // Espaciado entre elementos
        Text(
          text, // Texto de información
            style: const TextStyle(
              color: Colors.white, // Color del texto
            ),
        ),
      ],
    );
  }
}

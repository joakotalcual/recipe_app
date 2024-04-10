// Importación del paquete de Flutter para los widgets de Material Design
import 'package:flutter/material.dart';

// Importación del paquete flutter_svg para mostrar imágenes SVG
import 'package:flutter_svg/svg.dart';

// Importaciones de archivos locales
import 'package:recipe_app/constants.dart'; // Importación de constantes de la aplicación
import 'package:recipe_app/size_config.dart'; // Importación de la configuración de tamaño

// Clase StatelessWidget para los elementos de menú en el perfil
class ProfileMenuItem extends StatelessWidget {
  // Constructor de la clase
  const ProfileMenuItem({
    super.key,
    required this.iconSrc,
    required this.title,
    required this.press,
  });

  // Atributos requeridos para los elementos del menú
  final String iconSrc, title;
  final VoidCallback press;

  // Método de construcción de la interfaz de usuario
  @override
  Widget build(BuildContext context) {
    // Tamaño predeterminado para la configuración de tamaño
    double defaultSize = SizeConfig.defaultSize;
    // Widget InkWell para el reconocimiento de gestos táctiles
    return InkWell(
      // Acción al tocar el elemento del menú
      onTap: press,
      // Contenido del elemento del menú
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: defaultSize * 1,
          vertical: defaultSize * 1,
        ),
        child: SafeArea(
          child: Row(
            children: <Widget>[
              // Icono SVG del elemento del menú
              SvgPicture.asset(iconSrc),
              SizedBox(width: defaultSize * 2), // Espaciado entre el icono y el título
              // Título del elemento del menú
              Text(
                title,
                style: TextStyle(
                  fontSize: defaultSize * 1, // Tamaño de fuente del título
                  color: kTextLigntColor, // Color del texto del título
                ),
              ),
              const Spacer(), // Espaciador flexible para mover el ícono a la derecha
              // Icono de flecha hacia adelante para indicar la acción de navegación
              Icon(
                Icons.arrow_forward_ios,
                size: defaultSize * 1, // Tamaño del ícono de flecha
              ),
            ],
          ),
        ),
      ),
    );
  }
}

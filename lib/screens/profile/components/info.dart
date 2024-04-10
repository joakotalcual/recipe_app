// Importación del paquete de Flutter para los widgets de Material Design
import 'package:flutter/material.dart';

// Importaciones de archivos locales
import 'package:recipe_app/constants.dart'; // Importación de constantes de la aplicación
import 'package:recipe_app/size_config.dart'; // Importación de la configuración de tamaño

// Clase StatelessWidget para mostrar información del usuario
class Info extends StatelessWidget {
  // Constructor de la clase
  const Info({
    super.key,
    required this.image,
    required this.name,
    required this.email,
  });

  // Atributos requeridos para la información del usuario
  final String image, name, email;

  // Método de construcción de la interfaz de usuario
  @override
  Widget build(BuildContext context) {
    // Tamaño predeterminado para la configuración de tamaño
    double defaultSize = SizeConfig.defaultSize;

    // Contenedor de tamaño específico para mostrar la información del usuario
    return SizedBox(
      height: defaultSize * 16, //160
      child: Stack(
        children: <Widget>[
          // Recorte personalizado para la parte superior del contenedor
          ClipPath(
            clipper: CustomShape(),
            child: Container(
              height: defaultSize * 10, //100
              color: kPrimaryColor, // Color de fondo del recorte personalizado
            ),
          ),
          // Centro de la pila para el contenido de la información del usuario
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                // Contenedor circular para la imagen del usuario
                Container(
                  height: defaultSize * 8,
                  width: defaultSize * 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle, // Forma del contenedor
                    border: Border.all(
                      color: Colors.white, // Color del borde del contenedor
                      width: defaultSize * 0.2, // Ancho del borde del contenedor
                    ),
                    // Imagen del usuario
                    image: DecorationImage(
                      fit: BoxFit.cover, // Ajuste de la imagen
                      image: AssetImage(image), // Ruta de la imagen
                    ),
                  ),
                ),
                // Nombre del usuario
                Text(
                  name,
                  style: TextStyle(
                    fontSize: defaultSize * 1.5, // Tamaño de fuente del nombre
                    color: kTextColor, // Color del texto del nombre
                  ),
                ),
                SizedBox(height: defaultSize / 2,), // Espaciado entre el nombre y el correo electrónico
                // Correo electrónico del usuario
                Text(
                  email,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400, // Grosor de la fuente del correo electrónico
                    color: Color(0xFF8492A2), // Color del texto del correo electrónico
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Clase CustomClipper para crear una forma personalizada para el recorte
class CustomShape extends CustomClipper<Path>{
  // Método para obtener el recorte personalizado
  Path getClip(Size size){
    var path = Path();
    double height = size.height;
    double width = size.width;
    path.lineTo(0, height - 100); // Línea hasta el punto inicial de la curva cuadrática
    path.quadraticBezierTo(width / 2, height, width, height - 100); // Curva cuadrática hasta el punto final de la curva
    path.lineTo(width, 0); // Línea hasta el punto final del contenedor
    path.close(); // Cierre del recorte
    return path; // Devolución del recorte
  }

  // Método para indicar si se debe volver a recortar
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper){
    throw true; // Señal de que debe volver a recortar
  }
}

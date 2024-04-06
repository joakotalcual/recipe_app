import 'package:flutter/widgets.dart'; // Importa el paquete flutter/widgets.dart.

class SizeConfig { // Define una clase SizeConfig.
  static MediaQueryData _mediaQueryData = const MediaQueryData(); // Declara una variable estática para los datos de consulta de medios.
  static double screenWidth = 0; // Declara una variable estática para el ancho de la pantalla.
  static double screenHeight = 0; // Declara una variable estática para la altura de la pantalla.
  static double defaultSize = 0; // Declara una variable estática para el tamaño predeterminado.
  static Orientation orientation = Orientation.portrait; // Declara una variable estática para la orientación.

  void init(BuildContext context) { // Método para inicializar SizeConfig con el contexto proporcionado.
    _mediaQueryData = MediaQuery.of(context); // Obtiene los datos de consulta de medios del contexto.
    screenWidth = _mediaQueryData.size.width; // Asigna el ancho de la pantalla.
    screenHeight = _mediaQueryData.size.height; // Asigna la altura de la pantalla.
    orientation = _mediaQueryData.orientation; // Asigna la orientación de la pantalla.

  //En iphone 11 el tamano por defecto es = 10
  //Si el tamano de la pantalla aumenta o disminuye entonces nuestro tamano por defecto igual
    defaultSize = orientation == Orientation.landscape // Calcula el tamaño predeterminado según la orientación.
        ? screenWidth * 0.024
        : screenHeight * 0.024;
  }
}

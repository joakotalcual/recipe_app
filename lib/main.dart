// Importaciones necesarias
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/firebase_options.dart'; // Importación de opciones de Firebase
import 'package:recipe_app/models/nav_item.dart'; // Importación del modelo de ítems de navegación
import 'package:recipe_app/screens/home/home_screen.dart'; // Importación de la pantalla de inicio

void main() async {
  // Asegurarse de que Flutter esté inicializado
  WidgetsFlutterBinding.ensureInitialized();
  // Inicializar Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, // Opciones de inicialización de Firebase
  );

  // Ejecutar la aplicación
  runApp(const MyApp());
}

// Clase principal de la aplicación
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Método build que construye la interfaz de usuario de la aplicación
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      // Proveedor de cambio de notificador para proporcionar la lista de ítems de navegación
      create: (context) => NavItems(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false, // Ocultar banner de modo de depuración
        title: 'Recipe App', // Título de la aplicación
        theme: ThemeData(
          // Tema de la aplicación
          scaffoldBackgroundColor: Colors.white, // Color de fondo de las páginas
          appBarTheme: const AppBarTheme(color: Colors.white, elevation: 0), // Tema del AppBar
          useMaterial3: true, // Utilizar Material 3
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple), // Esquema de colores
        ),
        home: HomeScreen(), // Página de inicio de la aplicación
      ),
    );
  }
}

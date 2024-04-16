import 'package:flutter/material.dart'; // Importación del paquete de Flutter para la interfaz de usuario
 //import 'package:recipe/models/recipe_bundel.dart'; // Importación del modelo de RecipeBundle (actualmente no utilizado)
import 'package:recipe/screens/home/components/categories.dart'; // Importación del widget de categorías
import 'package:recipe/screens/home/components/recipe_bundle_card.dart'; // Importación del widget de tarjeta de RecipeBundle
import 'package:recipe/screens/recipe/edit_recipe_screen.dart';
import 'package:recipe/services/firebase_service.dart'; // Importación del servicio Firebase
import 'package:recipe/size_config.dart'; // Importación de la configuración de tamaño

// Clase StatelessWidget para el cuerpo de la pantalla principal (home)
class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}


class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        // Constructor FutureBuilder para construir basado en un Future
        future: getRecipes(), // Future para obtener las recetas
        builder: ((context, snapshot) {
          // Builder para construir basado en el snapshot
          if (snapshot.hasData) {
            // Si hay datos en el snapshot
            return SafeArea(
              // Área segura
              child: Column(
                // Columna principal
                children: <Widget>[
                  const Categories(), // Widget de categorías
                  Expanded(
                    // Expandido
                    child: Padding(
                      // Relleno
                      padding: EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize * 1), // Relleno horizontal
                      child: GridView.builder(
                        // Constructor de cuadrícula
                        itemCount: snapshot.data?.length, // Número de elementos en la lista
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          // Delegado de la cuadrícula con recuento de ejes cruzados fijos
                          crossAxisCount: SizeConfig.orientation == Orientation.landscape ? 2 : 1, // Número de columnas basado en la orientación
                          mainAxisSpacing: 20, // Espacio principal entre elementos
                          crossAxisSpacing: SizeConfig.orientation == Orientation.landscape ? SizeConfig.defaultSize * 1.5 : 0, // Espacio entre ejes cruzados
                          childAspectRatio: 1.6, // Relación de aspecto de los elementos
                        ),
                        itemBuilder: (context, index) => RecipeBundelCard(
                          // Constructor de elementos de la cuadrícula con la tarjeta de RecipeBundle
                          recipeBundle: snapshot.data?[index], // Receta actual
                          press: () async {
                            await Navigator.push(context, MaterialPageRoute(builder: (context) => const EditRecipe(),
                              settings: RouteSettings(
                                arguments: snapshot.data?[index],// Pasando argumentos al widget Navegación a la pantalla de agregar recetas
                              ),
                            ));
                            setState((){});
                          }, // Acción al presionar la tarjeta
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            // Si no hay datos en el snapshot
            return const Center(
              // Centro
              child: CircularProgressIndicator(), // Indicador de progreso circular (manejo de carga si no hay datos)
            );
          }
        }),
      ),
    );
  }
}


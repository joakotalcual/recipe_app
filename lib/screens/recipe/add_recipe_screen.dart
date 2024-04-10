// Importación del paquete dart:math para generar números aleatorios
import 'dart:math';

// Importaciones necesarias de Flutter y otros archivos
import 'package:flutter/material.dart';
import 'package:recipe_app/services/firebase_service.dart'; // Importación del servicio Firebase
import 'package:recipe_app/size_config.dart'; // Importación de la configuración de tamaño

// Clase StatefulWidget para la pantalla de agregar receta
class AddRecipe extends StatefulWidget {
  const AddRecipe({super.key});

  // Método para crear el estado correspondiente
  @override
  State<AddRecipe> createState() => _AddRecipeState();
}

// Clase de estado para la pantalla de agregar receta
class _AddRecipeState extends State<AddRecipe> {
  // Controladores para los campos de entrada de texto
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController cooksController = TextEditingController();
  TextEditingController recipesController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  TextEditingController colorController = TextEditingController();
  double defaultSize = SizeConfig.defaultSize;

  // Método de construcción de la interfaz de usuario
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ADD RECIPE"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: defaultSize * 0.2, horizontal: defaultSize * 1.5),
        child: Column(
          children: <Widget>[
            // Método para crear campos de texto
            textFields(TextInputType.text, titleController, "Enter the title"),
            textFields(TextInputType.text, descriptionController, "Enter description"),
            textFields(TextInputType.number, cooksController, "Enter the number of cooks"),
            textFields(TextInputType.number, recipesController, "Enter the number of recipes"),
            textFields(TextInputType.text, imageController, "Enter the image"),
            textFields(TextInputType.text, colorController, "Enter the color"),
            // Botón para guardar la receta
            ElevatedButton(
              onPressed: () async {
                await addPeople(
                  titleController.text,
                  descriptionController.text,
                  cooksController.text,
                  recipesController.text,
                  random(true), // Generar una imagen aleatoria
                  random(false), // Generar un color aleatorio
                ).then((_) => Navigator.pop(context));
              },
              child: const Text("Save")
            ),
          ],
        ),
      ),
    );
  }

  // Método para crear campos de texto
  TextField textFields(textInputType, nameController, holder) {
    return TextField(
      keyboardType: textInputType,
      controller: nameController,
      decoration: InputDecoration(
        hintText: holder,
      ),
    );
  }

  // Método para generar una imagen aleatoria o un color aleatorio
  String random(image) {
    Random random = Random();
    // Generar un número entero aleatorio entre 0 y 2
    int randomNumber = random.nextInt(3);
    if (image) {
      // Generar una imagen aleatoria
      switch (randomNumber) {
        case 0:
          return 'assets/images/kisspng_chicken_tikka.png';
        case 1:
          return "assets/images/food_court.png";
        default:
          return "assets/images/cook_new@2x.png";
      }
    } else {
      // Generar un color aleatorio
      switch (randomNumber) {
        case 0:
          return "0xFF90AF17";
        case 1:
          return "0xFFD82D40";
        default:
          return "0xFFA82D80";
      }
    }
  }
}

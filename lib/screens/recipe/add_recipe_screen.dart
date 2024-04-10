
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:recipe_app/services/firebase_service.dart';
import 'package:recipe_app/size_config.dart';

class AddRecipe extends StatefulWidget {
  const AddRecipe({super.key});

  @override
  State<AddRecipe> createState() => _AddRecipeState();
}

class _AddRecipeState extends State<AddRecipe> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController cooksController = TextEditingController();
  TextEditingController recipesController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  TextEditingController colorController = TextEditingController();
  double defaultSize = SizeConfig.defaultSize;

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
            textFields(TextInputType.text, titleController, "Enter the title"),
            textFields(TextInputType.text, descriptionController, "Enter description"),
            textFields(TextInputType.number, cooksController, "Enter the number of cooks"),
            textFields(TextInputType.number, recipesController, "Enter the number of recipes"),
            textFields(TextInputType.text, imageController, "Enter the image"),
            textFields(TextInputType.text, colorController, "Enter the color"),
            ElevatedButton(
              onPressed: () async{
                await addPeople(titleController.text, descriptionController.text, cooksController.text, recipesController.text, random(true), random(false)).then((_)
                  => Navigator.pop(context)
                );
              },
              child: const Text("Save")
            ),
          ],
        ),
      ),
    );
  }

  TextField textFields(textInputType, nameController, holder) {
    return TextField(
            keyboardType: textInputType,
            controller: nameController,
            decoration: InputDecoration(
              hintText: holder,
            ),
          );
  }

  String random(image){
    Random random = Random();
    // Generar un número entero aleatorio entre 0 y 2
    int randomNumber = random.nextInt(3);
    if(image){
      switch(randomNumber) {
        case 0: return 'assets/images/kisspng_chicken_tikka.png';
        case 1: return "assets/images/food_court.png";
        default: return "assets/images/cook_new@2x.png";
      }
    }else{
      switch(randomNumber) {
        case 0: return "0xFF90AF17";
        case 1: return "0xFFD82D40";
        default: return "0xFFA82D80";
      }
    }
  }
}
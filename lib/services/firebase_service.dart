// Importación del paquete de Firestore para interactuar con la base de datos
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// Importación del modelo RecipeBundle
import 'package:recipe/models/recipe_bundel.dart';

// Instancia de Firestore
FirebaseFirestore db = FirebaseFirestore.instance;

// Función asíncrona para obtener las recetas de la base de datos
Future<List<RecipeBundle>> getRecipes() async {
  try {
    // Lista para almacenar las recetas
    List<RecipeBundle> recipes = [];

    // Referencia a la colección 'recipe' en Firestore
    CollectionReference collectionReferenceRecipes = db.collection('recipe');

    // Obtener las recetas de Firestore
    QuerySnapshot queryRecipes = await collectionReferenceRecipes.get();

    // Iterar sobre los documentos obtenidos
    queryRecipes.docs.forEach((document) {
      // Convertir los datos del documento a un mapa
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      // Crear una instancia de RecipeBundle con los datos del documento
      RecipeBundle recipe = RecipeBundle(
        uid: document.id, //obtiene id del documento
        chefs: int.tryParse(data['chefs'].toString()) ?? 0, //Obtiene el numero de cocineros
        recipes: int.tryParse(data['recipes'].toString()) ?? 0, //Obtiene el numero de recetas
        title: data['title'].toString(), //Obtiene el titulo de la receta
        description: data['description'].toString(),//Obtiene la descripcion de la receta
        imageSrc: data['imageSrc'].toString(),//Obtiene la ruta de image
        color: parseColor(data['color']),//Parsea el hexadecimal a un Color de material
      );
      // Agregar la receta a la lista de recetas
      recipes.add(recipe);
    });
    // Retornar la lista de recetas después de una demora simulada de 2 segundos
    //await Future.delayed( const Duration(seconds: 2));
    return recipes;
  } catch (e) {
    // Manejar cualquier error que ocurra al obtener las recetas
    return []; // O cualquier otra acción que desees tomar en caso de error
  }
}

// Función asíncrona para agregar una nueva receta a la base de datos
Future<void> addRecipe(String title, String description, int numberCooks, int numberRecipes, String image, String color) async {
  // Añadir la nueva receta a la colección 'recipe' en Firestore
  await db.collection('recipe').add({
    "chefs": numberCooks,
    "color": color,
    "description": description,
    "imageSrc": image,
    "recipes": numberRecipes,
    "title": title
  });
}

Future<void> updateRecipe(String uid, String newTitle, String newDescription, int newNumberCooks, int newNumberRecipes, String newImage, String newColor) async {
  await db.collection('recipe').doc(uid).update({
    "chefs": newNumberCooks,
    "color": newColor,
    "description": newDescription,
    "imageSrc": newImage,
    "recipes": newNumberRecipes,
    "title": newTitle
  });
}

// Función para analizar una cadena de color hexadecimal y devolver un objeto Color
Color parseColor(String colorString) {
  // Obtener el valor entero del color hexadecimal (sin el prefijo '0x')
  int colorValue = int.tryParse(colorString.substring(2), radix: 16) ?? 0xFF000000;
  // Crear un objeto Color con el valor obtenido
  return Color(colorValue);
}

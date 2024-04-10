// Importación del paquete de Firestore para interactuar con la base de datos
import 'package:cloud_firestore/cloud_firestore.dart';

// Importación del paquete de Flutter para los widgets de Material Design
import 'package:flutter/material.dart';

// Importación del modelo RecipeBundle
import 'package:recipe_app/models/recipe_bundel.dart';

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
        uid: document.id.toString(),
        chefs: int.tryParse(data['chefs'].toString()) ?? 0,
        recipes: int.tryParse(data['recipes'].toString()) ?? 0,
        title: data['title'].toString(),
        description: data['description'].toString(),
        imageSrc: data['imageSrc'].toString(),
        color: parseColor(data['color'].toString()),
      );
      // Agregar la receta a la lista de recetas
      recipes.add(recipe);
    });

    // Retornar la lista de recetas después de una demora simulada de 2 segundos
    await Future.delayed(Duration(seconds: 2));
    return recipes;
  } catch (e) {
    // Manejar cualquier error que ocurra al obtener las recetas
    return []; // O cualquier otra acción que desees tomar en caso de error
  }
}

// Función asíncrona para agregar una nueva receta a la base de datos
Future<void> addPeople(title, description, numberCooks, numberRecipes, image, color) async {
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

// Función para analizar una cadena de color hexadecimal y devolver un objeto Color
Color parseColor(String colorString) {
  // Obtener el valor entero del color hexadecimal (sin el prefijo '0x')
  int colorValue = int.tryParse(colorString.substring(2), radix: 16) ?? 0xFF000000;
  // Crear un objeto Color con el valor obtenido
  return Color(colorValue);
}

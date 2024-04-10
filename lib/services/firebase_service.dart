import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/models/recipe_bundel.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List<RecipeBundle>> getRecipes() async {
  try {
    List<RecipeBundle> recipes = [];

    CollectionReference collectionReferenceRecipes = db.collection('recipe');

    QuerySnapshot queryRecipes = await collectionReferenceRecipes.get();

    queryRecipes.docs.forEach((document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      RecipeBundle recipe = RecipeBundle(
        uid: document.id.toString(),
        chefs: int.tryParse(data['chefs'].toString()) ?? 0,
        recipes: int.tryParse(data['recipes'].toString()) ?? 0,
        title: data['title'].toString(),
        description: data['description'].toString(),
        imageSrc: data['imageSrc'].toString(),
        color: parseColor(data['color'].toString()),
      );
      recipes.add(recipe);
    });
    await Future.delayed(Duration(seconds: 2));
    return recipes;
  } catch (e) {
    print('Error fetching recipes: $e');
    return []; // O cualquier otra acción que desees tomar en caso de error
  }
}

Future<void> addPeople(title, description, numberCooks, numberRecipes, image, color) async{
  await db.collection('recipe').add({"chefs": numberCooks, "color": color, "description": description, "imageSrc": image, "recipes": numberRecipes, "title": title});
}



Color parseColor(String colorString) {
  int colorValue = int.tryParse(colorString.substring(2), radix: 16) ?? 0xFF000000;
  return Color(colorValue);
}
import 'package:flutter/material.dart';

// Clase RecipeBundle que representa un paquete de recetas
class RecipeBundle {
  final int chefs, recipes; // Número de cocineros y recetas
  final String uid, title, description, imageSrc; // Identificador único, título, descripción, fuente de imagen
  final Color color; // Color del paquete

  RecipeBundle({
    required this.uid, // Identificador único
    required this.chefs, // Número de cocineros
    required this.recipes, // Número de recetas
    required this.title, // Título
    required this.description, // Descripción
    required this.imageSrc, // Fuente de imagen
    required this.color // Color
  });

}

// List<RecipeBundle> recipeBundles = [ // Lista de paquetes de recetas (actualmente comentada)
//   RecipeBundle(
//     id: 1,
//     chefs: 16,
//     recipes: 95,
//     title: "Cook Something New Everyday",
//     description: "New and tasty recipes every minute",
//     imageSrc: "assets/images/cook_new@2x.png",
//     color: const Color(0xFFD82D40)
//   ),
//   RecipeBundle(
//     id: 2,
//     chefs: 8,
//     recipes: 26,
//     title: "Best of 2020",
//     description: "Cook recipes for special occasions",
//     imageSrc: "assets/images/best_2020@2x.png",
//     color: const Color(0xFF90AF17)
//   ),
//   RecipeBundle(
//     id: 3,
//     chefs: 10,
//     recipes: 43,
//     title: "Food Court",
//     description: "What´s your favoritee food dish make it now",
//     imageSrc: "assets/images/food_court@2x.png",
//     color: const Color(0xB407FBFF)
//   ),
// ];

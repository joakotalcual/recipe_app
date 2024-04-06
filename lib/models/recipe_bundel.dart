
import 'package:flutter/material.dart';

class RecipeBundle {
  final int id = 0, chefs = 0, recipes = 0;
  final String title ='', description = '', imageSrc = '';
  final Color color = Colors.white;

  RecipeBundle({
    required id,
    required chefs,
    required recipes,
    required title,
    required description,
    required imageSrc,
    required color
  });

}

List<RecipeBundle> recipeBundles = [
  RecipeBundle(
    id: 1,
    chefs: 16,
    recipes: 95,
    title: "Cook Something New Everyday",
    description: "New and tasty recipes every minute",
    imageSrc: "assets/images/cook_new@2x.png",
    color: const Color(0xFFD82D40)
  ),
  RecipeBundle(
    id: 2,
    chefs: 8,
    recipes: 26,
    title: "Best of 2020",
    description: "Cook recipes for special occasions",
    imageSrc: "assets/images/best_2020@2x.png",
    color: const Color(0xFF90AF17)
  ),
  RecipeBundle(
    id: 3,
    chefs: 10,
    recipes: 43,
    title: "Food Court",
    description: "What´s your favoritee food dish make it now",
    imageSrc: "assets/images/food_court@2x.png",
    color: const Color(0xB407FBFF)
  ),
];
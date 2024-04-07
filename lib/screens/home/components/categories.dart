//Nuestra lista de categorias necesarias pra el statefullwidget

import 'package:flutter/material.dart';
import 'package:recipe_app/constants.dart';
import 'package:recipe_app/size_config.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories = ['All', 'Indian', 'Italian', 'Mexican', 'Chinese'];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: SizeConfig.defaultSize * 0.5),
      child: SizedBox(
        height: SizeConfig.defaultSize * 2.5, //25
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) => buildCategoriItem(index),
        ),
      ),
    );
  }

  Widget buildCategoriItem(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(left: SizeConfig.defaultSize * 0.5),
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.defaultSize * 1.4, //14
          vertical: SizeConfig.defaultSize * 0.5, //5
        ),
        decoration: BoxDecoration(
          color: selectedIndex == index ? Color(0xFFEFF3EE) : Colors.transparent,
          borderRadius: BorderRadius.circular(
            SizeConfig.defaultSize * 0.8 //8
          ),
        ),
        child: Text(
              categories[index],
              style: TextStyle(color: selectedIndex == index ? kPrimaryColor : Color(0xFFC2C2B5), fontWeight: FontWeight.bold),
          ),
      ),
    );
  }
}
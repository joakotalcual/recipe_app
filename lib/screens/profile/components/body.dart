import 'package:flutter/material.dart';
import 'package:recipe_app/screens/profile/components/info.dart';
import 'package:recipe_app/screens/profile/components/profile_menu_item.dart';
import 'package:recipe_app/screens/recipe/add_recipe_screen.dart';
import 'package:recipe_app/size_config.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          const Info(
            image: "assets/images/pic.png",
            name: "Jhon Doe",
            email: "Jhondoe01@gmail.com",
          ),
          SizedBox(height: SizeConfig.defaultSize * 1.5),
          ProfileMenuItem(
            iconSrc: "assets/icons/bookmark_fill.svg",
            title: "Saved Recipes",
            press: () async{
              print("PRESIONE");
              await Navigator.push(context, MaterialPageRoute(builder: (context) => const AddRecipe()),);
              
            },//HACER EL BACKEND
          ),
          ProfileMenuItem(
            iconSrc: "assets/icons/chef_color.svg",
            title: "Super Plan",
            press: (){},
          ),
          ProfileMenuItem(
            iconSrc: "assets/icons/language.svg",
            title: "Change Language",
            press: (){},
          ),
          ProfileMenuItem(
            iconSrc: "assets/icons/info.svg",
            title: "Help",
            press: (){},
          ),
        ],
      ),
    );
  }
}
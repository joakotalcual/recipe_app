import 'package:flutter/material.dart';
// import 'package:recipe_app/models/recipe_bundel.dart';
import 'package:recipe_app/screens/home/components/categories.dart';
import 'package:recipe_app/screens/home/components/recipe_bundle_card.dart';
import 'package:recipe_app/services/firebase_service.dart';
import 'package:recipe_app/size_config.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getRecipes(),
      builder: ((context, snapshot){
        if(snapshot.hasData){
          return SafeArea(
                  child: Column(
                    children: <Widget>[
                      const Categories(),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize * 1),
                          child: GridView.builder(
                            itemCount: snapshot.data?.length,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: SizeConfig.orientation == Orientation.landscape ? 2 : 1,
                              mainAxisSpacing: 20,
                              crossAxisSpacing: SizeConfig.orientation == Orientation.landscape ? SizeConfig.defaultSize * 1.5 : 0,
                              childAspectRatio: 1.6,
                            ),
                            itemBuilder: (context, index) => RecipeBundelCard(
                              recipeBundle: snapshot.data?[index],
                              press: () {},
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
        }else{
          return const Center(
            child: CircularProgressIndicator() // Manejo de carga si no hay datos,
          );
        }
      }),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:recipe_app/models/recipe_bundel.dart';
import 'package:recipe_app/size_config.dart';

class RecipeBundelCard extends StatelessWidget {
  final RecipeBundle recipeBundle;
  final VoidCallback press;

  const RecipeBundelCard({required this.recipeBundle, required this.press, super.key});

  @override
  Widget build(BuildContext context) {

    double defaultSize = SizeConfig.defaultSize;
    return GestureDetector(
      onTap: press,
      child: Container(
        decoration: BoxDecoration(
          color: recipeBundle.color,
          borderRadius: BorderRadius.circular(defaultSize * 1.8),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(defaultSize * 1.5), //20
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Spacer(),
                    Text(
                      recipeBundle.title,
                      style: TextStyle(
                        fontSize: defaultSize * 0.8,
                        color: Colors.white,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: defaultSize * 0.5), //5
                    Text(
                      recipeBundle.description,
                      style: const TextStyle(
                        color: Colors.white54
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                    buildInfRow(
                      defaultSize,
                      iconSrc: "assets/icons/pot.svg",
                      text: "${recipeBundle.recipes} Recipes"
                    ),
                    buildInfRow(
                      defaultSize,
                      iconSrc: "assets/icons/chef.svg",
                      text: "${recipeBundle.chefs} Chefs"
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
            SizedBox(width: defaultSize * 0.5),//5
            AspectRatio(
              aspectRatio: 0.71,
              child: Image.asset(
                recipeBundle.imageSrc,
                fit: BoxFit.cover,
                alignment: Alignment.centerLeft,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row buildInfRow(double defaultSize, {String? iconSrc, text}) {
    return Row(
      children: <Widget>[
        SvgPicture.asset(iconSrc!),
        SizedBox(width: defaultSize * 0.5),
        Text(
          text,
            style: const TextStyle(
              color: Colors.white,
            ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:recipe_app/constants.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: defaultSize * 24, //240
          child: Stack(
            children: <Widget>[
              ClipPath(
                child: Container(
                  child: defaultSize * 15, //150
                  color: kPrimaryColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}


class CustomShape extends CustmClipper<Path>{
  @override
  Path getClip(Size size){
    throw 
  }
}
import 'package:flutter/material.dart';
import 'package:recipe_app/constants.dart';
import 'package:recipe_app/size_config.dart';

class Info extends StatelessWidget {
  const Info({
    super.key,
    required this.image,
    required this.name,
    required this.email
  });
  final String image, name, email;

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;

    return SizedBox(
      height: defaultSize * 16, //160
      child: Stack(
        children: <Widget>[
          ClipPath(
            clipper: CustomShape(),
            child: Container(
              height: defaultSize * 10, //100
              color: kPrimaryColor,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  height: defaultSize * 8,
                  width: defaultSize * 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      width: defaultSize * 0.2,
                    ),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(image)
                    )
                  ),
                ),
                Text(
                  name,
                  style: TextStyle(
                    fontSize: defaultSize * 1.5,
                    color: kTextColor,
                  ),
                ),
                SizedBox(height: defaultSize / 2,),
                Text(
                  email,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF8492A2),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class CustomShape extends CustomClipper<Path>{
  Path getClip(Size size){
    var path = Path();
    double height = size.height;
    double width = size.width;
    path.lineTo(0, height - 100);
    path.quadraticBezierTo(width / 2, height, width, height - 100);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper){
    throw true;
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:recipe_app/constants.dart';
import 'package:recipe_app/size_config.dart';

class ProfileMenuItem extends StatelessWidget {
  const ProfileMenuItem({
    super.key,
    required this.iconSrc,
    required this.title,
    required this.press
  });

  final String iconSrc, title;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
  double defaultSize = SizeConfig.defaultSize;
    return InkWell(
      onTap: press,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: defaultSize * 1,
          vertical: defaultSize * 1,
        ),
        child: SafeArea(
          child: Row(
            children: <Widget>[
              SvgPicture.asset(iconSrc),
              SizedBox(width: defaultSize * 2),
              Text(
                title,
                style: TextStyle(
                  fontSize: defaultSize * 1,
                  color: kTextLigntColor,
                ),
              ),
              const Spacer(),
              Icon(
                Icons.arrow_forward_ios,
                size: defaultSize * 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


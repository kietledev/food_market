import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_market/helpers/size_config.dart';

class CustomSurffixIcon extends StatelessWidget {
  const CustomSurffixIcon({
    Key? key,
    required this.svgIcon,
  }) : super(key: key);

  final String svgIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        getProportionateScreenWidth(20),
        getProportionateScreenWidth(15),
        getProportionateScreenWidth(16),
        20,
      ),
      child: SvgPicture.asset(
        svgIcon,
        height: getProportionateScreenWidth(18),
      ),
    );
  }
}

class CustomCupertinoIcons extends StatelessWidget {
  const CustomCupertinoIcons({
    Key? key,
    required this.icon,
  }) : super(key: key);

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(
          getProportionateScreenWidth(20),
          getProportionateScreenWidth(15),
          getProportionateScreenWidth(18),
          20,
        ),
        child: Icon(
          icon,
          color: Colors.black38,
        ));
  }
}

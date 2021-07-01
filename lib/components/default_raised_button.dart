import 'package:flutter/material.dart';
import 'package:food_market/helpers/size_config.dart';

class DefaulRaisetButton extends StatelessWidget {
  const DefaulRaisetButton({
    Key? key,
    required this.text,
    required this.press,
  }) : super(key: key);
  final String text;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 139,
      height: getProportionateScreenHeight(40),
      // ignore: deprecated_member_use
      child: RaisedButton(
        onPressed: press,
        child: Text(
          text,
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
        color: Colors.red,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../helpers/constants.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    required this.text,
    required this.icon,
    this.press,
  }) : super(key: key);

  final String text, icon;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
              side: BorderSide(color: Colors.white),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(Color(0xFFF5F6F9)),
        ),
        onPressed: press,
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Row(children: [
            SvgPicture.asset(
              icon,
              color: kPrimaryColor,
              width: 22,
            ),
            SizedBox(width: 20),
            Expanded(
                child: Text(
              text,
              style: TextStyle(color: Colors.black),
            )),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
            ),
          ]),
        ),
      ),
    );
  }
}

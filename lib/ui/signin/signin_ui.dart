import 'package:flutter/material.dart';
import 'package:food_market/helpers/size_config.dart';
import 'package:food_market/ui/signin/components/body.dart';

// SizeConfig().init(context);
class SigninUI extends StatelessWidget {
  static String routeName = "/signin_ui";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sign in',
          style: TextStyle(
              color: Colors.black87, fontWeight: FontWeight.w500, fontSize: 22),
        ),
      ),
      body: Body(),
    );
  }
}

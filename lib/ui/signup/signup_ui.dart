import 'package:flutter/material.dart';

import 'components/body.dart';

class SignupUI extends StatelessWidget {
  static String routeName = '/signup_ui';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sign up',
          style: TextStyle(
              color: Colors.black87, fontWeight: FontWeight.w500, fontSize: 22),
        ),
      ),
      body: Body(),
    );
  }
}

import 'package:flutter/material.dart';

import 'components/body.dart';

class ProfileUI extends StatelessWidget {
  const ProfileUI({Key? key}) : super(key: key);
  static String routeName = '/profile_ui';
  static String title = 'Profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(
              color: Colors.black87, fontWeight: FontWeight.w500, fontSize: 22),
        ),
      ),
      body: Body(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:food_market/helpers/preferences.dart';
import 'package:food_market/ui/profile/components/profile_avatar.dart';
import 'package:food_market/ui/signin/signin_ui.dart';

import 'profile_menu.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfileAvatar(),
          SizedBox(height: 20),
          ProfileMenu(
            text: "My Account",
            icon: "assets/icons/User Icon.svg",
            press: () => {},
          ),
          ProfileMenu(
            text: "Notifications",
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Settings",
            icon: "assets/icons/Settings.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Help Center",
            icon: "assets/icons/Question mark.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Log Out",
            icon: "assets/icons/Log out.svg",
            press: () {
              final prefs = Preferences();
              prefs.clear();
              Navigator.of(context).pushNamedAndRemoveUntil(
                  SigninUI.routeName, (Route<dynamic> route) => false);
            },
          ),
        ],
      ),
    );
  }
}

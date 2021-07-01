import 'package:flutter/material.dart';

import 'components/body.dart';

class CompleteProfileUI extends StatelessWidget {
  static String routeName = '/complete_profile_ui';
  final String? emailSignup, passwordSignup;

  const CompleteProfileUI({Key? key, this.emailSignup, this.passwordSignup})
      : super(key: key);

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
      body: CompleteProfileInherited(
        emailSignup: emailSignup,
        passwordSignup: passwordSignup,
        child: Body(),
      ),
    );
  }
}

class CompleteProfileInherited extends InheritedWidget {
  final String? emailSignup, passwordSignup;

  CompleteProfileInherited(
      {required Widget child, this.emailSignup, this.passwordSignup})
      : super(child: child);

  @override
  bool updateShouldNotify(CompleteProfileInherited oldWidget) {
    /* Rebuild all Widget's that get value from CompleteProfileInherited.
    This is just an example to keep in mind */
    if (emailSignup != oldWidget.emailSignup) {
      return true;
    } else if (passwordSignup != oldWidget.passwordSignup) {
      return true;
    }
    return false;
  }

  static CompleteProfileInherited? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<CompleteProfileInherited>();
  }
}

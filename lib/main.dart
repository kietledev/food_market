import 'package:flutter/material.dart';
import 'package:food_market/ui/signin/signin_ui.dart';

import 'helpers/preferences.dart';
import 'helpers/routes.dart';
import 'helpers/theme.dart';
import 'ui/tab_bar/tab_bar_ui.dart';

bool remember = false;
void main() async {
  await initApplication();
  runApp(MyApp());
}

initApplication() async {
  WidgetsFlutterBinding.ensureInitialized(); // Important key
  final pref = Preferences();
  var token = await pref.getToken() ?? '';
  if (token.length > 0 || token.isNotEmpty) {
    remember = true;
  } else {
    remember = false;
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: remember ? TabBarUI.routeName : SigninUI.routeName,
        routes: routes,
        theme: theme(),
      ),
    );
  }
}

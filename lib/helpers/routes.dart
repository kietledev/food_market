import 'package:flutter/material.dart';
import 'package:food_market/ui/categories/categories_ui.dart';
import 'package:food_market/ui/comple_proflie/comple_profile_ui.dart';
import 'package:food_market/ui/home/home_ui.dart';
import 'package:food_market/ui/profile/profile.dart';
import 'package:food_market/ui/search/search_ui.dart';
import 'package:food_market/ui/signin/signin_ui.dart';
import 'package:food_market/ui/signup/signup_ui.dart';
import 'package:food_market/ui/tab_bar/tab_bar_ui.dart';

final Map<String, WidgetBuilder> routes = {
  // LaunchUI.routeName: (context) => LaunchUI(),
  SigninUI.routeName: (context) => SigninUI(),
  SignupUI.routeName: (context) => SignupUI(),
  CompleteProfileUI.routeName: (context) => CompleteProfileUI(),
  TabBarUI.routeName: (context) => TabBarUI(),
  HomeUI.routeName: (context) => HomeUI(),
  SearchUI.routeName: (context) => SearchUI(),
  CategoriesUI.routeName: (context) => CategoriesUI(),
  ProfileUI.routeName: (context) => ProfileUI(),
};

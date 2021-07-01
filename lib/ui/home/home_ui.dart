import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_market/bloc/home_bloc/home_bloc.dart';
import 'package:food_market/repositories/home_repository.dart';
import 'components/body.dart';

class HomeUI extends StatelessWidget {
  static String routeName = '/home_ui';
  static String title = 'Home';

  getTitle() {
    return title;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
          create: (context) => HomeBloc(HomeState(), HomeRepository()),
          child: Body()),
    );
  }
}

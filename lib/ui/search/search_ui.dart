import 'package:flutter/material.dart';

class SearchUI extends StatelessWidget {
  static String routeName = '/search_ui';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Center(
          child: Text('Search'),
        ),
      ),
    );
  }
}

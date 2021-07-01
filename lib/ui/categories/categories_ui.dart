import 'package:flutter/material.dart';

class CategoriesUI extends StatelessWidget {
  const CategoriesUI({Key? key}) : super(key: key);
  static String routeName = '/categories_ui';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Categories',
          style: TextStyle(
              color: Colors.black87, fontWeight: FontWeight.w500, fontSize: 22),
        ),
      ),
    );
  }
}

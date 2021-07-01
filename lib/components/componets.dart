import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

showViewLoading(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Center(
        child: CircularProgressIndicator(),
      );
    },
  );
}

hideViewLoading(BuildContext context) {
  Navigator.of(context).pop(context);
}

showOKAlertDialog(String title, String content, BuildContext context) {
  // Set up the button
  Widget buttonOk = TextButton(
    child: Text(
      "OK",
    ),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // Set up the AlertDialog
  CupertinoAlertDialog alert = CupertinoAlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [buttonOk] //listFunctions,
      );

  // Show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<bool> onBackButtonPressed(BuildContext context) async {
  bool exit = await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Really?"),
        content: Text('Do you want to close app'),
        actions: [
          TextButton(
            onPressed: () {
              (Navigator.of(context).pop(false));
            },
            child: Text('No'),
          ),
          TextButton(
            onPressed: () {
              SystemNavigator.pop();
            },
            child: Text('yes'),
          ),
        ],
      );
    },
  );
  return exit ?? false;
}

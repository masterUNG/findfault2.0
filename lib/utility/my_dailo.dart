import 'package:flutter/material.dart';

class Mydialog {
  Future<Null> normalDialog(
      BuildContext context, String titel, String message) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(titel),
        content: Text(message),
        actions: [TextButton(onPressed: () => Navigator.pop(context), child: Text('OK'))],
      ),
    );
  }
}

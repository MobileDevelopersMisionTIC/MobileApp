import 'package:flutter/material.dart';

class Utilities {
  BuildContext context;

  Utilities(this.context);

  void snackMessage(String message) {
    final screen = ScaffoldMessenger.of(context);
    screen.showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: Colors.blue.shade900,
    ));
  }
}

import 'package:flutter/material.dart';

class SnackBarService {
  static const errorColor = Colors.red;
  static const okColor = Colors.green;

  static Future<void> showSnackBar(
      BuildContext context, String message, bool error) async {
    ScaffoldMessenger.of(context)
        .removeCurrentSnackBar(); //удаление снакбара чтобы новый не закладывался вверх старого

    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: error ? errorColor : okColor,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget customButton({
  required void Function() onPressed,
  required String text,
  Color colorButton = const Color(0xFF229784),
  Color colorText = Colors.white,
  double widthButton = double.infinity,
  double heightButton = 50.0,
  double radius = 30,
}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: colorButton,
      foregroundColor: colorText,
      minimumSize: Size(widthButton, heightButton),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
    ),

    onPressed: onPressed,

    child: Text(text, style: TextStyle(fontSize: 16)),
  );
}

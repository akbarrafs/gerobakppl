import 'package:flutter/material.dart';

Text inputText(String text, double size, FontWeight weight, Color color) {
  return Text(
    text,
    style: TextStyle(
        fontWeight: weight, fontSize: size, fontFamily: 'Nunito', color: color),
  );
}

TextStyle textStyle(double size, FontWeight weight, Color color) {
  return TextStyle(
    color: color,
    fontSize: size,
    fontWeight: weight,
    fontFamily: 'Nunito',
  );
}

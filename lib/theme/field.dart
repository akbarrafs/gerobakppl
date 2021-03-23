import 'package:flutter/material.dart';
import 'package:first_app/theme/color.dart';
import 'package:first_app/theme/text.dart';

InputDecoration formInputDecoration() {
  return InputDecoration(
    hintStyle: textStyle(15, FontWeight.w600, black),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: black),
      borderRadius: BorderRadius.circular(6),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: black),
      borderRadius: BorderRadius.circular(6),
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide(color: black),
      borderRadius: BorderRadius.circular(6),
    ),
    contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
  );
}

import 'package:first_app/theme/color.dart';
import 'package:flutter/material.dart';

ButtonStyle elevatedButtonStyle(Color primary, Color onPrimary) {
  return ElevatedButton.styleFrom(
      primary: primary,
      onPrimary: onPrimary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(13),
      ));
}

ButtonStyle outlinedButtonStyle(Color primary, Color background) {
  return OutlinedButton.styleFrom(
      primary: primary,
      backgroundColor: background,
      side: BorderSide(
        color: primary,
        width: 2.0,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(13),
      ));
}

ButtonStyle primaryButtonStyle() {
  return TextButton.styleFrom(
    backgroundColor: yellow,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
  );
}

ButtonStyle secondaryButtonStyle() {
  return TextButton.styleFrom(
    backgroundColor: black,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
  );
}

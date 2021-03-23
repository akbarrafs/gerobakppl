import 'package:flutter/material.dart';
import 'package:first_app/theme/theme.dart';

AppBar theAppBar() {
  return AppBar(
    backgroundColor: Colors.transparent,
    bottomOpacity: 0.0,
    elevation: 0.0,
    centerTitle: true,
    title: Text(
      "Gerobak",
      style: TextStyle(
        fontFamily: 'Nunito-ExtraBold',
        fontSize: 50,
        color: Color(0xFF1C2A39),
      ),
    ),
  );
}

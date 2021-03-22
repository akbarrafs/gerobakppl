import 'package:first_app/object/gerobak.dart';
import 'package:first_app/util/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:first_app/util/widgets/home_screen.dart';

class GerobakApp extends StatelessWidget {
  Gerobak gerobak;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(),
      theme: basicTheme(),
      home: HomeScreen(),
    );
  }
}

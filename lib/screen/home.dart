import 'package:first_app/object/gerobak.dart';
import 'package:first_app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:first_app/screen/home_screen.dart';

class GerobakApp extends StatelessWidget {
  Gerobak gerobak;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(),
      theme: basicTheme(),
      home: HomeScreen(),
      key: Key('GerobakApp Key'),
    );
  }
}

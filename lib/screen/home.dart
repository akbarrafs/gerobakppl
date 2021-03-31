import 'package:gerobak_flutter/object/gerobak.dart';
import 'package:gerobak_flutter/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:gerobak_flutter/screen/home_screen.dart';

class GerobakApp extends StatelessWidget {
  Gerobak gerobak;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: basicTheme(),
      home: HomeScreen(),
      key: Key('GerobakApp Key'),
    );
  }
}

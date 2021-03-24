import 'package:first_app/screen/input_menu/input_menu_view.dart';
import 'package:first_app/theme/theme.dart';
import 'package:flutter/material.dart';

class InputMenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: basicTheme(),
      home: InputMenuPage(),
      key: Key('InputMenuScreen Key'),
    );
  }
}

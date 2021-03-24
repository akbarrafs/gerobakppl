import 'package:first_app/screen/show_gerobak_detail/show_gerobak_detail_view.dart';
import 'package:first_app/theme/theme.dart';
import 'package:flutter/material.dart';

class ShowGerobakDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: basicTheme(),
      home: ShowGerobakDetail(),
      key: Key('ShowGerobakDetailScreen Key'),
    );
  }
}

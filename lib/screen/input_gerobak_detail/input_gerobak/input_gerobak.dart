import 'package:gerobak_flutter/theme/theme.dart';
import 'package:flutter/material.dart';

import 'input_gerobak_view.dart';

class InputGerobakScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: basicTheme(),
      home: InputGerobak(),
      key: Key('InputGerobakScreen Key'),
    );
  }
}

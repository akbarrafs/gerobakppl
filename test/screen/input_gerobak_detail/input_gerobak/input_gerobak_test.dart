import 'package:gerobak_flutter/screen/input_gerobak_detail/input_gerobak/input_gerobak.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('InputGerobakScreen Test', (WidgetTester tester) async {
    final widget1 = find.byKey(Key('InputGerobakScreen Key'));
    await tester.pumpWidget(InputGerobakScreen());

    expect(widget1, findsOneWidget);
  });
}

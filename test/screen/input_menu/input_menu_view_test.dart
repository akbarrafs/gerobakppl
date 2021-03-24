import 'package:first_app/screen/input_menu/input_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('InputMenuScreen Test', (WidgetTester tester) async {
    final widget1 = find.byKey(Key('InputMenuScreen Key'));
    await tester.pumpWidget(InputMenuScreen());

    expect(widget1, findsOneWidget);
  });
}

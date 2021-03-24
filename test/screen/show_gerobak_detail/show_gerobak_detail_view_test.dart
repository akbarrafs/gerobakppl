import 'package:first_app/screen/show_gerobak_detail/show_gerobak_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:first_app/screen/home.dart';

void main() {
  testWidgets('ShowGerobakDetailScreen Test', (WidgetTester tester) async {
    final widget1 = find.byKey(Key('ShowGerobakDetailScreen Key'));
    await tester.pumpWidget(ShowGerobakDetailScreen());

    expect(widget1, findsOneWidget);
  });
}

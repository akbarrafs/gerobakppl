import 'package:first_app/screen/input_gerobak_detail/input_menu/input_menu_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Texts are present in Input Menu Page',
      (WidgetTester tester) async {
    final widget1 = find.byKey(Key('Text TambahMenu'));
    final widget2 = find.byKey(Key('Text Kembali'));
    final widget3 = find.byKey(Key('Text Simpan'));
    final widget4 = find.byKey(Key('Text MasukkanMenu'));

    final widget5 = find.byKey(Key('Text TambhMneu'));
    final widget6 = find.byKey(Key('Text Kmbali'));
    final widget7 = find.byKey(Key('Text Smpan'));
    final widget8 = find.byKey(Key('Text MskkanMenu'));

    await tester.pumpWidget(MaterialApp(home: InputMenuPage()));

    expect(widget1, findsOneWidget);
    expect(widget2, findsOneWidget);
    expect(widget3, findsOneWidget);
    expect(widget4, findsOneWidget);

    expect(widget5, findsNothing);
    expect(widget6, findsNothing);
    expect(widget7, findsNothing);
    expect(widget8, findsNothing);
  });
  testWidgets('Buttons are present in Input Menu Page',
      (WidgetTester tester) async {
    // final widget1 = find.byKey(Key('TextButton TambahMenu'));
    // final widget2 = find.byKey(Key('TextButton Kembali'));
    // final widget3 = find.byKey(Key('TextButton Simpan'));

    await tester.pumpWidget(MaterialApp(home: InputMenuPage()));

    // await tester.tap(widget1);
    // await tester.tap(widget2);
    // await tester.tap(widget3);
    // await tester.pumpAndSettle();

    // expect(widget1, findsOneWidget);
    // expect(widget2, findsOneWidget);
    // expect(widget3, findsOneWidget);
  });

  // testWidgets('ListView are present in Input Menu Page',
  //     (WidgetTester tester) async {
  //   final widget1 = find.byKey(Key('ListView FieldMenu'));
  //   final widget2 = find.byKey(Key('ListView FiledMenu'));

  //   await tester.pumpWidget(MaterialApp(home: InputMenuPage()));
  //   await tester.tap(widget1);
  //   await tester.tap(widget2);

  //   expect(widget1, findsOneWidget);
  //   expect(widget2, findsNothing);
  // });
}

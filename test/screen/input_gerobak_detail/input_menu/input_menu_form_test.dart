import 'package:gerobak_flutter/screen/input_gerobak_detail/input_menu/input_menu_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Texts are present in Input Menu Form',
      (WidgetTester tester) async {
    final widget1 = find.byKey(Key('Text Menu'));
    final widget2 = find.byKey(Key('Text Harga'));
    final widget3 = find.byKey(Key('Text Hapus'));

    final widget4 = find.byKey(Key('Text Nemu'));
    final widget5 = find.byKey(Key('Text HrgA'));
    final widget6 = find.byKey(Key('Text Hpus'));

    await tester.pumpWidget(MaterialApp(home: InputMenuForm()));

    expect(widget1, findsOneWidget);
    expect(widget2, findsOneWidget);
    expect(widget3, findsOneWidget);

    expect(widget4, findsNothing);
    expect(widget5, findsNothing);
    expect(widget6, findsNothing);
  });

  testWidgets('Textfield are present in Input Menu Form',
      (WidgetTester tester) async {
    final widget1 = find.byKey(Key('TextFormField Menu'));
    final widget2 = find.byKey(Key('TextFormField Harga'));
    final widget3 = find.byKey(Key('TextFormField Nemu'));
    final widget4 = find.byKey(Key('TextFormField Hraga'));

    await tester.pumpWidget(MaterialApp(home: InputMenuForm()));
    await tester.tap(widget1);
    await tester.pump();
    await tester.tap(widget2);
    await tester.pump();

    expect(widget1, findsOneWidget);
    expect(widget2, findsOneWidget);

    expect(widget3, findsNothing);
    expect(widget4, findsNothing);
  });

  testWidgets('TextField are submitted', (WidgetTester tester) async {
    final widget1 = find.byKey(Key('TextFormField Menu'));
    final widget2 = find.byKey(Key('TextFormField Harga'));

    await tester.pumpWidget(MaterialApp(home: InputMenuForm()));
    await tester.tap(widget1);
    await tester.enterText(widget1, 'Samlikum');
    await tester.pump();
    expect(find.text('Samlikum'), findsOneWidget);

    await tester.tap(widget2);
    await tester.enterText(widget2, 'Kumsalam');
    await tester.pump();
    expect(find.text('Kumsalam'), findsOneWidget);
  });
  testWidgets('Icon Button is present in Input Menu Form',
      (WidgetTester tester) async {
    final widget1 = find.byKey(Key('IconButton Hapus'));
    final widget2 = find.byKey(Key('IconButton HpUs'));

    await tester.pumpWidget(MaterialApp(home: InputMenuForm()));
    await tester.pump();

    expect(widget1, findsOneWidget);

    expect(widget2, findsNothing);
  });

  testWidgets('onFieldSubmit callbacks are called in Input Menu Form',
      (WidgetTester tester) async {
    bool _called = false;

    await tester.pumpWidget(MaterialApp(home: InputMenuForm()));
    await tester.pumpAndSettle();
    await tester.pumpWidget(
      MaterialApp(
        home: Material(
          child: Center(
            child: TextFormField(
              onFieldSubmitted: (String value) {
                _called = true;
              },
            ),
          ),
        ),
      ),
    );

    await tester.showKeyboard(find.byType(TextField));
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();
    expect(_called, true);
  });
}

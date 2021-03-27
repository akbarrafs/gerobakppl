import 'package:first_app/screen/input_gerobak/input_gerobak_view.dart';
import 'package:first_app/screen/input_gerobak_detail/input_gerobak/input_gerobak_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  MockNavigatorObserver mockObserver;

  setUp(() {
    mockObserver = MockNavigatorObserver();
    reset(mockObserver);
  });
  Widget makeTestableWidget({Widget child}) {
    return MaterialApp(
      home: child,
      navigatorObservers: [mockObserver],
    );
  }

  testWidgets('Texts are present in InputGerobak', (WidgetTester tester) async {
    final widget1 = find.byKey(Key('Text NamaGerobak'));
    final widget2 = find.byKey(Key('Text FotoGerobak'));
    final widget3 = find.byKey(Key('Text TipeMakanan'));
    final widget4 = find.byKey(Key('Text Status'));

    await tester.pumpWidget(MaterialApp(home: InputGerobak()));

    expect(widget1, findsOneWidget);
    expect(widget2, findsOneWidget);
    expect(widget3, findsOneWidget);
    expect(widget4, findsOneWidget);
  });
  testWidgets('Buttons are present in InputGerobak',
      (WidgetTester tester) async {
    final widget1 = find.byKey(Key('TextButton Upload'));
    final widget2 = find.byKey(Key('TextButton Submit'));
    final widget3 = find.byKey(Key('TextButton Informasi'));

    await tester.pumpWidget(MaterialApp(home: InputGerobak()));

    await tester.tap(widget1);
    await tester.tap(widget2);
    await tester.tap(widget3);
    await tester.pumpAndSettle();

    expect(widget1, findsOneWidget);
    expect(widget2, findsOneWidget);
    expect(widget3, findsOneWidget);
  });

  testWidgets('Image are not present when not inputed',
      (WidgetTester tester) async {
    final widget1 = find.byKey(Key('Image Gerobak'));
    await tester.pumpWidget(MaterialApp(home: InputGerobak()));
    expect(widget1, findsNothing);
  });

  testWidgets('Textfield are present in Input Gerobak',
      (WidgetTester tester) async {
    final widget1 = find.byKey(Key('TextFormField namaGerobak'));
    final widget2 = find.byKey(Key('TextFormField tipeMakanan'));

    await tester.pumpWidget(MaterialApp(home: InputGerobak()));
    await tester.tap(widget1);
    await tester.tap(widget2);

    expect(widget1, findsOneWidget);
    expect(widget2, findsOneWidget);
  });

  // testWidgets('Dialog is presents in InputGerobak',
  //     (WidgetTester tester) async {
  //   await tester.pumpWidget(MaterialApp(home: InputGerobak()));
  //   await tester.pumpAndSettle();

  //   final widget1 = find.byKey(Key('TextButton Upload'));
  //   await tester.tap(widget1);
  //   final widget2 = find.byKey(Key('Dialog Upload Choice'));
  //   expect(widget2, findsOneWidget);
  //   await tester.tapAt(Offset(5, 10));

  //   final widget3 = find.byKey(Key('TextButton Informasi'));
  //   await tester.tap(widget3);
  //   final widget4 = find.byKey(Key('Dialog Informasi'));
  //   expect(widget4, findsOneWidget);
  // });

  // testWidgets('Test the button is validate and move to another screen',
  //     (WidgetTester tester) async {
  //   InputGerobak widget1 = InputGerobak();
  //   await tester.pumpWidget(makeTestableWidget(child: widget1));
  //   await tester.pumpAndSettle();

  //   verify(mockObserver.didPush(any, any));

  //   await tester.tap(find.byKey(Key('Button Submit')));
  //   await tester.pumpAndSettle();

  //   verify(mockObserver.didPush(any, any));
  //   expect(find.byKey(Key('InputMenuScreen Key')), findsOneWidget);
  // });
}

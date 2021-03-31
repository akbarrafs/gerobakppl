import 'package:gerobak_flutter/screen/show_gerobak_detail/show_gerobak_detail_view.dart';
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

  // testWidgets('Texts are present in ShowGerobakDetail',
  //     (WidgetTester tester) async {
  //   final widget1 = find.byKey(Key('Text DetailGerobakDetail'));
  //   final widget2 = find.byKey(Key('Text NamaGerobakDetail'));
  //   final widget3 = find.byKey(Key('Text TipeMakananDetail'));
  //   final widget4 = find.byKey(Key('Text RatingDetail'));

  //   final widget5 = find.byKey(Key('Text DetilGrobakDetil'));
  //   final widget6 = find.byKey(Key('Text NameGrobakDetil'));
  //   final widget7 = find.byKey(Key('Text TpeMakananDetil'));
  //   final widget8 = find.byKey(Key('Text RetingDetailDetil'));

  //   await tester.pumpWidget(MaterialApp(home: ShowGerobakDetail()));

  //   expect(widget1, findsOneWidget);
  //   expect(widget2, findsOneWidget);
  //   expect(widget3, findsOneWidget);
  //   expect(widget4, findsOneWidget);

  //   expect(widget5, findsNothing);
  //   expect(widget6, findsNothing);
  //   expect(widget7, findsNothing);
  //   expect(widget8, findsNothing);
  // });
  // testWidgets('Data Tables are present in ShowGerobakDetail',
  //     (WidgetTester tester) async {
  //   final widget1 = find.byKey(Key('Table DataTableDetail'));

  //   final widget2 = find.byKey(Key('Tabll DataTbleDetil'));

  //   await tester.pumpWidget(MaterialApp(home: ShowGerobakDetail()));

  //   expect(widget1, findsOneWidget);

  //   expect(widget2, findsNothing);
  // });
  testWidgets('Button is present in ShowGerobakDetail',
      (WidgetTester tester) async {
    final widget1 = find.byKey(Key('Button PesanDetail'));

    final widget2 = find.byKey(Key('Buttin PsenDetil'));

    await tester.pumpWidget(MaterialApp(home: ShowGerobakDetail()));

    await tester.tap(widget1);
    await tester.pumpAndSettle();

    expect(widget1, findsOneWidget);

    expect(widget2, findsNothing);
  });

  // testWidgets('Radio buttons are present in ShowGerobakDetail',
  //     (WidgetTester tester) async {
  //   final widget1 = find.byKey(Key('Radio AntarDetail'));
  //   final widget2 = find.byKey(Key('Radio JemputDetail'));

  //   final widget3 = find.byKey(Key('Radii antrDetil'));
  //   final widget4 = find.byKey(Key('Radii JmputDtil'));

  //   await tester.pumpWidget(MaterialApp(home: ShowGerobakDetail()));

  //   await tester.tap(widget1);
  //   await tester.tap(widget2);
  //   await tester.pumpAndSettle();

  //   expect(widget1, findsOneWidget);
  //   expect(widget2, findsOneWidget);

  //   expect(widget3, findsNothing);
  //   expect(widget4, findsNothing);
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

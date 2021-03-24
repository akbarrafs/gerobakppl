import 'package:first_app/screen/input_gerobak/input_gerobak_view.dart';
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
    final namaGerobakText = find.byKey(Key('Text NamaGerobak'));
    final fotoGerobakText = find.byKey(Key('Text FotoGerobak'));
    final tipeMakananText = find.byKey(Key('Text TipeMakanan'));
    final statusText = find.byKey(Key('Text Status'));

    await tester.pumpWidget(MaterialApp(home: InputGerobak()));

    expect(namaGerobakText, findsOneWidget);
    expect(fotoGerobakText, findsOneWidget);
    expect(tipeMakananText, findsOneWidget);
    expect(statusText, findsOneWidget);
  });
  testWidgets('Buttons are present in InputGerobak',
      (WidgetTester tester) async {
    final buttonUpload = find.byKey(Key('Button Upload'));
    final buttonSubmit = find.byKey(Key('Button Submit'));
    final buttonInformasi = find.byKey(Key('Button Informasi'));

    await tester.pumpWidget(MaterialApp(home: InputGerobak()));

    await tester.tap(buttonUpload);
    await tester.tap(buttonSubmit);
    await tester.tap(buttonInformasi);
    await tester.pumpAndSettle();

    expect(buttonUpload, findsOneWidget);
    expect(buttonSubmit, findsOneWidget);
    expect(buttonInformasi, findsOneWidget);
  });

  testWidgets('Image are not present when not inputed',
      (WidgetTester tester) async {
    final imageGerobak = find.byKey(Key('Image Gerobak'));
    await tester.pumpWidget(MaterialApp(home: InputGerobak()));
    expect(imageGerobak, findsNothing);
  });

  testWidgets('Navigate InputGerobakScreen Test', (WidgetTester tester) async {
    await tester.pumpWidget(makeTestableWidget(child: InputGerobak()));
    await tester.pumpAndSettle();

    verify(mockObserver.didPush(any, any));

    await tester.tap(find.byKey(Key('Button Submit')));
    await tester.pumpAndSettle();

    verify(mockObserver.didPush(any, any));
    expect(find.byKey(Key('InputMenuScreen Key')), findsOneWidget);
  });
}

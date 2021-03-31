import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gerobak_flutter/screen/input_gerobak_detail/ubah_gerobak/ubah_gerobak_view.dart';
import 'package:mockito/mockito.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
//   MockNavigatorObserver mockObserver;

//   setUp(() {
//     mockObserver = MockNavigatorObserver();
//     reset(mockObserver);
//   });
//   Widget makeTestableWidget({Widget child}) {
//     return MaterialApp(
//       home: child,
//       navigatorObservers: [mockObserver],
//     );
//   }

//   testWidgets('Texts are present in Ubah Gerobak', (WidgetTester tester) async {
//     final widget1 = find.byKey(Key('Text NamaGerobak'));
//     final widget2 = find.byKey(Key('Text FotoGerobak'));
//     final widget3 = find.byKey(Key('Text TipeMakanan'));
//     final widget4 = find.byKey(Key('Text Status'));

//     final widget5 = find.byKey(Key('Text NamaGeborak'));
//     final widget6 = find.byKey(Key('Text FotoGeborak'));
//     final widget7 = find.byKey(Key('Text TipeManakan'));
//     final widget8 = find.byKey(Key('Text Statsu'));

//     await tester.pumpWidget(MaterialApp(home: UbahGerobak()));

//     expect(widget1, findsOneWidget);
//     expect(widget2, findsOneWidget);
//     expect(widget3, findsOneWidget);
//     expect(widget4, findsOneWidget);

//     expect(widget5, findsNothing);
//     expect(widget6, findsNothing);
//     expect(widget7, findsNothing);
//     expect(widget8, findsNothing);
//   });
//   testWidgets('Buttons are present in Ubah Gerobak',
//       (WidgetTester tester) async {
//     final widget1 = find.byKey(Key('TextButton Upload'));
//     final widget2 = find.byKey(Key('TextButton Submit'));
//     final widget3 = find.byKey(Key('TextButton Informasi'));

//     final widget4 = find.byKey(Key('TextButton Uplaod'));
//     final widget5 = find.byKey(Key('TextButton Sumbit'));
//     final widget6 = find.byKey(Key('TextButton Infromasi'));

//     await tester.pumpWidget(MaterialApp(home: UbahGerobak()));

//     await tester.tap(widget1);
//     await tester.pump();
//     expect(widget1, findsOneWidget);

//     await tester.tap(widget2);
//     await tester.pump();
//     expect(widget2, findsOneWidget);

//     await tester.tap(widget3);
//     await tester.pump();
//     expect(widget3, findsOneWidget);

//     expect(widget4, findsNothing);
//     expect(widget5, findsNothing);
//     expect(widget6, findsNothing);
//   });

//   testWidgets('Image are not present when not inputed in Ubah Gerobak',
//       (WidgetTester tester) async {
//     final widget1 = find.byKey(Key('Image Gerobak'));
//     await tester.pumpWidget(MaterialApp(home: UbahGerobak()));
//     expect(widget1, findsNothing);
//   });

//   testWidgets('Textfield are present in Ubah Gerobak',
//       (WidgetTester tester) async {
//     final widget1 = find.byKey(Key('TextFormField namaGerobak'));
//     final widget2 = find.byKey(Key('TextFormField tipeMakanan'));

//     final widget3 = find.byKey(Key('TextFormField namaGeborak'));
//     final widget4 = find.byKey(Key('TextFormField tipeManakan'));

//     await tester.pumpWidget(MaterialApp(home: UbahGerobak()));
//     await tester.tap(widget1);
//     await tester.tap(widget2);

//     expect(widget1, findsOneWidget);
//     expect(widget2, findsOneWidget);

//     expect(widget3, findsNothing);
//     expect(widget4, findsNothing);
//   });

//   testWidgets('Dialog Alerts are presents in Ubah Gerobak',
//       (WidgetTester tester) async {
//     final widget1 = find.byKey(Key('TextButton Upload'));
//     final widget2 = find.byKey(Key('Dialog Upload Choice'));
//     final widget3 = find.byKey(Key('TextButton Informasi'));
//     final widget4 = find.byKey(Key('Dialog Informasi'));
//     final widget5 = find.byKey(Key('TextButton Close'));

//     await tester.pumpWidget(MaterialApp(home: UbahGerobak()));
//     await tester.pumpAndSettle();

//     await tester.tap(widget1);
//     await tester.pump();
//     expect(widget2, findsOneWidget);

//     await tester.tap(widget5);
//     await tester.pump();

//     await tester.tap(widget3);
//     await tester.pump();
//     expect(widget4, findsOneWidget);
//   });

//   testWidgets('OnGesture can be pressed in Ubah Gerobak',
//       (WidgetTester tester) async {
//     final widget1 = find.byKey(Key('TextButton Upload'));
//     final widget3 = find.byKey(Key('Gesture OpenGallery'));
//     final widget4 = find.byKey(Key('Gesture OpenCamera'));

//     await tester.pumpWidget(MaterialApp(home: UbahGerobak()));
//     await tester.pumpAndSettle();

//     await tester.tap(widget1);
//     await tester.pump();
//     await tester.tap(widget3);
//     expect(widget3, findsOneWidget);

//     await tester.tap(widget1);
//     await tester.pump();
//     await tester.tap(widget4);
//     expect(widget4, findsOneWidget);
//   });
//   testWidgets('CheckBox can be pressed in Ubah Gerobak',
//       (WidgetTester tester) async {
//     final widget1 = find.byKey(Key('Checkbox Antar'));
//     final widget2 = find.byKey(Key('Checkbox Jemput'));

//     await tester.pumpWidget(MaterialApp(home: UbahGerobak()));
//     await tester.pumpAndSettle();

//     await tester.tap(widget1);
//     await tester.pump();
//     expect(widget1, findsOneWidget);

//     await tester.tap(widget2);
//     await tester.pump();
//     expect(widget2, findsOneWidget);
//   });

//   // testWidgets('Test the button is validate and move to another screen',
//   //     (WidgetTester tester) async {
//   //   UbahGerobak widget1 = UbahGerobak();
//   //   await tester.pumpWidget(makeTestableWidget(child: widget1));
//   //   await tester.pumpAndSettle();

//   //   verify(mockObserver.didPush(any, any));

//   //   await tester.tap(find.byKey(Key('Button Submit')));
//   //   await tester.pumpAndSettle();

//   //   verify(mockObserver.didPush(any, any));
//   //   expect(find.byKey(Key('InputMenuScreen Key')), findsOneWidget);
//   // });
}

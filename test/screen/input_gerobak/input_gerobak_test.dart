import 'package:first_app/model/modelg.dart';
import 'package:first_app/screen/input_gerobak/input_gerobak_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Nama: Empty Nama Field Error", () {
    final result = NamaFieldValidator.validate('');
    expect(result, 'Nama gerobak harus diisi!');
  });
  test("Tipe Makanan: Empty Tipe Makanan Error", () {
    final result = TipeMakananFieldValidator.validate('');
    expect(result, 'Tipe Makanan harus diisi!');
  });
  testWidgets('Text Gerobak Screen Test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: InputGerobak()));
    final namaGerobakText = find.byKey(Key('NamaGerobak Text'));
    final fotoGerobakText = find.byKey(Key('FotoGerobak Text'));
    final tipeMakananText = find.byKey(Key('TipeMakanan Text'));
    final statusText = find.byKey(Key('Status Text'));

    expect(namaGerobakText, findsOneWidget);
    expect(fotoGerobakText, findsOneWidget);
    expect(tipeMakananText, findsOneWidget);
    expect(statusText, findsOneWidget);
  });
  testWidgets('Buttons are present in InputGerobak',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: InputGerobak()));
    final buttonUpload = find.byKey(Key('Button Upload'));
    final buttonSubmit = find.byKey(Key('Button Submit'));
    final buttonInformasi = find.byKey(Key('Button Informasi'));

    await tester.tap(buttonUpload);
    await tester.tap(buttonSubmit);
    await tester.tap(buttonInformasi);
    await tester.pumpAndSettle();

    expect(buttonUpload, findsOneWidget);
    expect(buttonSubmit, findsOneWidget);
    expect(buttonInformasi, findsOneWidget);
  });
}

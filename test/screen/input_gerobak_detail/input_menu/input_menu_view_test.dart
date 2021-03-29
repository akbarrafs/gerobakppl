import 'dart:io';

import 'package:gerobak_flutter/screen/input_gerobak_detail/input_menu/input_menu_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Texts are present in Input Menu Page',
      (WidgetTester tester) async {
    String namaGerobak;
    String foto;
    String tipeMakanan;
    bool antar;
    bool jemput;
    final widget1 = find.byKey(Key('Text TambahMenu'));
    final widget2 = find.byKey(Key('Text Kembali'));
    final widget3 = find.byKey(Key('Text Simpan'));
    final widget4 = find.byKey(Key('Text MasukkanMenu'));

    final widget5 = find.byKey(Key('Text TambhMneu'));
    final widget6 = find.byKey(Key('Text Kmbali'));
    final widget7 = find.byKey(Key('Text Smpan'));
    final widget8 = find.byKey(Key('Text MskkanMenu'));

    await tester.pumpWidget(MaterialApp(
        home: InputMenuPage(namaGerobak, foto, tipeMakanan, antar, jemput)));

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
    String namaGerobak;
    String foto;
    String tipeMakanan;
    bool antar;
    bool jemput;
    final widget1 = find.byKey(Key('TextButton TambahMenu'));
    final widget2 = find.byKey(Key('TextButton Kembali'));
    final widget3 = find.byKey(Key('TextButton Simpan'));

    final widget4 = find.byKey(Key('TextButton TambahNemu'));
    final widget5 = find.byKey(Key('TextButton Kelambi'));
    final widget6 = find.byKey(Key('TextButton Smipan'));

    await tester.pumpWidget(MaterialApp(
        home: InputMenuPage(namaGerobak, foto, tipeMakanan, antar, jemput)));

    await tester.tap(widget1);
    await tester.pump();
    expect(widget1, findsOneWidget);
    expect(widget4, findsNothing);

    await tester.tap(widget2);
    await tester.pump();
    expect(widget2, findsOneWidget);
    expect(widget5, findsNothing);

    await tester.tap(widget3);
    await tester.pump();
    expect(widget3, findsOneWidget);
    expect(widget6, findsNothing);
  });

  testWidgets('TextField Input Menu is present in Input Menu Page',
      (WidgetTester tester) async {
    String namaGerobak;
    String foto;
    String tipeMakanan;
    bool antar;
    bool jemput;
    final widget1 = find.byKey(Key('TextButton TambahMenu'));
    final widget2 = find.byKey(Key('TextFormField Menu'));
    final widget3 = find.byKey(Key('TextFormField Harga'));
    final widget4 = find.byKey(Key('IconButton Hapus'));

    final widget5 = find.byKey(Key('TextFormField Nemu'));
    final widget6 = find.byKey(Key('TextFormField Hraga'));
    final widget7 = find.byKey(Key('IconButton Hapsu'));

    await tester.pumpWidget(MaterialApp(
        home: InputMenuPage(namaGerobak, foto, tipeMakanan, antar, jemput)));

    await tester.tap(widget1);
    await tester.pump();

    expect(widget2, findsOneWidget);
    expect(widget3, findsOneWidget);
    expect(widget4, findsOneWidget);

    expect(widget5, findsNothing);
    expect(widget6, findsNothing);
    expect(widget7, findsNothing);
  });

  testWidgets('TextField Input Menu is deleted in Input Menu Page',
      (WidgetTester tester) async {
    String namaGerobak;
    String foto;
    String tipeMakanan;
    bool antar;
    bool jemput;
    final widget1 = find.byKey(Key('TextButton TambahMenu'));
    final widget2 = find.byKey(Key('TextFormField Menu'));
    final widget3 = find.byKey(Key('TextFormField Harga'));
    final widget4 = find.byKey(Key('IconButton Hapus'));

    final widget5 = find.byKey(Key('TextFormField Nemu'));
    final widget6 = find.byKey(Key('TextFormField Hraga'));
    final widget7 = find.byKey(Key('IconButton Hapsu'));

    await tester.pumpWidget(MaterialApp(
        home: InputMenuPage(namaGerobak, foto, tipeMakanan, antar, jemput)));

    await tester.tap(widget1);
    await tester.pump();
    await tester.tap(widget4);
    await tester.pump();

    expect(widget2, findsNothing);
    expect(widget3, findsNothing);
    expect(widget4, findsNothing);

    expect(widget5, findsNothing);
    expect(widget6, findsNothing);
    expect(widget7, findsNothing);
  });

  testWidgets('ListView are present in Input Menu Page',
      (WidgetTester tester) async {
    String namaGerobak;
    String foto;
    String tipeMakanan;
    bool antar;
    bool jemput;
    final widget1 = find.byKey(Key('TextButton TambahMenu'));
    final widget2 = find.byKey(Key('ListView FieldMenu'));

    final widget3 = find.byKey(Key('ListView FiledMenu'));

    await tester.pumpWidget(MaterialApp(
        home: InputMenuPage(namaGerobak, foto, tipeMakanan, antar, jemput)));
    await tester.tap(widget1);
    await tester.pump();

    expect(widget2, findsOneWidget);

    expect(widget3, findsNothing);
  });

  testWidgets('AlertBox Success are presents in Input Menu',
      (WidgetTester tester) async {
    String namaGerobak;
    String foto;
    String tipeMakanan;
    bool antar;
    bool jemput;
    final widget3 = find.byKey(Key('Text Simpan'));
    await tester.pumpWidget(MaterialApp(
        home: InputMenuPage(namaGerobak, foto, tipeMakanan, antar, jemput)));
  });
}

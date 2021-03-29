import 'package:gerobak_flutter/model/akbar_model.dart';
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
  test("Nama Menu: Empty Nama Menu Field Error", () {
    final result = NamaMenuValidator.validate('');
    expect(result, 'Menu harus diisi!');
  });
  test("Harga Makanan: Empty Harga Makanan Error", () {
    final result = HargaMenuValidator.validate('');
    expect(result, 'Harga harus diisi!');
  });
}

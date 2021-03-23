import 'package:first_app/model/modelg.dart';
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
}

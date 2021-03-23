import 'dart:io';

import 'package:first_app/screen/input_gerobak/input_gerobak_view.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

abstract class InputGerobakModel extends State<InputGerobak> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ImagePicker picker = ImagePicker();
  TextEditingController namaGerobakCont = TextEditingController();
  TextEditingController tipeMakananCont = TextEditingController();
  String namaGerobak;
  File foto;
  String tipeMakanan;
  bool antar;
  bool jemput;
}

class NamaFieldValidator {
  static String validate(String value) {
    return value.isEmpty ? 'Nama gerobak harus diisi!' : null;
  }
}

class TipeMakananFieldValidator {
  static String validate(String value) {
    return value.isEmpty ? 'Tipe Makanan harus diisi!' : null;
  }
}

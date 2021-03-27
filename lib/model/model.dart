import 'dart:io';

import 'package:first_app/object/menu.dart';
import 'package:first_app/screen/input_gerobak_detail/input_gerobak/input_gerobak_view.dart';
import 'package:first_app/screen/show_gerobak_detail/show_gerobak_detail_view.dart';
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

  @override
  void initState() {
    super.initState();
    antar = false;
    jemput = false;
  }
}

abstract class ShowGerobakDetailModel extends State<ShowGerobakDetail> {
  List<Menu> menus;
  bool sort;
  bool antar;
  bool jemput;

  void initState() {
    sort = false;
    antar = false;
    jemput = false;
    menus = Menu.getMenu();
    super.initState();
  }
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

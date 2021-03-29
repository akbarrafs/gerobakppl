import 'dart:convert';
import 'dart:io';

import 'package:gerobak_flutter/screen/input_gerobak_detail/input_menu/input_menu_form.dart';
import 'package:gerobak_flutter/screen/input_gerobak_detail/input_menu/input_menu_view.dart';
import 'package:gerobak_flutter/object/menu.dart';
import 'package:gerobak_flutter/object/gerobak.dart';
import 'package:gerobak_flutter/screen/input_gerobak_detail/input_gerobak/input_gerobak_view.dart';
import 'package:gerobak_flutter/screen/input_gerobak_detail/ubah_gerobak/ubah_gerobak_view.dart';
import 'package:gerobak_flutter/screen/show_gerobak_detail/show_gerobak_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

abstract class InputGerobakModel extends State<InputGerobak> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ImagePicker picker = ImagePicker();
  TextEditingController namaGerobakCont = TextEditingController();
  TextEditingController tipeMakananCont = TextEditingController();
  String namaGerobak;
  String foto;
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

abstract class InputMenuFormModel extends State<InputMenuForm> {
  TextEditingController namaMenu = TextEditingController();
  TextEditingController hargaMenu = TextEditingController();
}

abstract class InputMenuPageModel extends State<InputMenuPage> {
  Future<http.Response> simpan(
    String namaGerobak,
    String fotoGerobak,
    String tipeMakanan,
    bool statusAntar,
    bool statusJemput,
    List<Menu> listMenu,
  ) async {
    print('Berhasil Disimpan');
    Uri url = Uri.parse('http://dev-gerobak.herokuapp.com/gerobak/add');
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization':
            'Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhcGFuZGFyYWZzQGdtYWlsLmNvbSIsImlhdCI6MTYxNzAwNzMzMiwiZXhwIjoxNjE3MDkzNzMyfQ.hG_1iR350-ofd8bgfiFaLnNlCMn9qDu_S4dtaK6NY-A3RnpvK5IDNiEqs4ZkWFeviATmpr0b3dgQiMLm0LfrXA',
      },
      body: jsonEncode(<String, dynamic>{
        "namaGerobak": namaGerobak,
        "fotoGerobak": fotoGerobak,
        "tipeBarang": tipeMakanan,
        "statusAntar": statusAntar,
        "statusJemput": statusJemput,
        "listMenu": listMenu,
      }),
    );
    // print('Keluar: ');
    // print(namaGerobak);
    // print(fotoGerobak);
    // print(tipeMakanan);
    // print(statusAntar);
    // print(statusJemput);
    // print(listMenu);
    // print(response.statusCode);
    // print(response.body);
    // final Map parsedResponse = json.decode(response.body);
  }
}

abstract class UbahGerobakModel extends State<UbahGerobak> {
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
  bool sort;
  Future<Gerobak> gerobakDownload;
  Future<Gerobak> fetchGerobak() async {
    Uri url = Uri.parse('http://dev-gerobak.herokuapp.com/gerobak/view/164');
    // final response = await http.get(Uri.https(
    //   'raw.githubusercontent.com',
    //   'akbarrafs/jsonkusayank/master/cobain.json',
    // ));
    final response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization':
            "Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhcGFuZGFyYWZzQGdtYWlsLmNvbSIsImlhdCI6MTYxNzAwNTA5NywiZXhwIjoxNjE3MDkxNDk3fQ.zIxHgC6iSaaNxGXz1Xpvwnvl5LwF9bopQN2i-_prFs-Ux2NfXVCzvH9dNuQorCVKcjEJ6TyTm07vniDgvjGNlg",
      },
    );

    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      return Gerobak.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load Gerobak");
    }
  }

  void initState() {
    super.initState();
    sort = false;
    gerobakDownload = fetchGerobak();
  }
}

class NamaFieldValidator {
  static String validate(String value) {
    if (value.isEmpty) {
      return 'Nama gerobak harus diisi!';
    }
    return null;
  }
}

class TipeMakananFieldValidator {
  static String validate(String value) {
    if (value.isEmpty) {
      return 'Tipe Makanan harus diisi!';
    }
    return null;
  }
}

class NamaMenuValidator {
  static String validate(String value) {
    if (value.isEmpty) {
      return 'Menu harus diisi!';
    }
    return null;
  }
}

class HargaMenuValidator {
  static String validate(String value) {
    if (value.isEmpty) {
      return 'Harga harus diisi!';
    }
    return null;
  }
}

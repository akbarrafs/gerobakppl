import 'dart:io';

import 'menu.dart';

class Gerobak {
  String namaGerobak;
  File foto;
  String tipeMakanan;
  String rating = '5';
  bool antar;
  bool jemput;
  List<Menu> listMenu;

  void initState() {
    antar = false;
    jemput = false;
  }

  Gerobak(
      {this.namaGerobak, this.foto, this.tipeMakanan, this.antar, this.jemput});

  // String getNamaGerobak() {
  //   return this.namaGerobak;
  // }

  // File getFoto() {
  //   return this.foto;
  // }

  // bool getAntar() {
  //   return this.antar;
  // }

  // bool getJemput() {
  //   return this.jemput;
  // }

  // List<Menu> getListMenu() {
  //   return this.listMenu;
  // }
}

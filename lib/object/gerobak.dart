import 'dart:io';

import 'menu.dart';

class Gerobak {
  String namaGerobak;
  File fotoGerobak;
  String tipeMakanan;
  String rating;
  bool statusAntar;
  bool statusJemput;
  List<Menu> listMenu;

  void initState() {
    statusAntar = false;
    statusJemput = false;
  }

  Gerobak({
    this.namaGerobak,
    this.fotoGerobak,
    this.tipeMakanan,
    this.statusAntar,
    this.statusJemput,
    this.listMenu,
  });
}

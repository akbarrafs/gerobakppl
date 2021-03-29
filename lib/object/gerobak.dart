import 'menu.dart';

class Gerobak {
  String namaGerobak;
  String fotoGerobak;
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

  factory Gerobak.fromJson(Map<String, dynamic> json) {
    List<Menu> tempListMenu = [];
    for (int i = 0; i < json['listMenu'].length; i++) {
      tempListMenu.add(Menu.fromJson(json['listMenu'][i]));
    }
    return Gerobak(
      namaGerobak: json['namaGerobak'],
      fotoGerobak: json['fotoGerobak'],
      tipeMakanan: json['tipeBarang'],
      statusAntar: json['statusAntar'],
      statusJemput: json['statusJemput'],
      listMenu: tempListMenu,
    );
  }

  Map<String, dynamic> toJson() => {
        "namaGerobak": namaGerobak,
        "fotoGerobak": fotoGerobak,
        "tipeBarang": tipeMakanan,
        "statusAntar": statusAntar,
        "statusJemput": statusJemput,
        "listMenu": listMenu,
      };
}

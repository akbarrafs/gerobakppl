class Menu {
  String namaMenu;
  int harga;

  Menu({this.namaMenu, this.harga});

  Map<String, dynamic> toJson() => {
        "namaMenu": namaMenu,
        "harga": harga,
      };

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
        namaMenu: json['namaMenu'],
        harga: json['harga'],
      );
}

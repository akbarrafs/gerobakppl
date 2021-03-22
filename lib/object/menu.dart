class Menu {
  String namaMenu;
  String hargaMenu;

  Menu({this.namaMenu, this.hargaMenu});

  static List<Menu> getMenu() {
    return <Menu>[
      Menu(namaMenu: "Sate Ayam", hargaMenu: "Rp. 50.000,-"),
      Menu(namaMenu: "Bubur Ayam", hargaMenu: "Rp. 40.000,-"),
      Menu(namaMenu: "Nasi Ayam", hargaMenu: "Rp. 30.000,-"),
      Menu(namaMenu: "Geprek Ayam", hargaMenu: "Rp. 20.000,-"),
      Menu(namaMenu: "Sop Ayam", hargaMenu: "Rp. 10.000,-"),
      Menu(namaMenu: "Jus Ayam", hargaMenu: "Rp. 5.000,-"),
    ];
  }
}

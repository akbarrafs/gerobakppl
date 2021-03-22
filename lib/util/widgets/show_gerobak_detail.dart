import 'package:flutter/material.dart';

import '../../object/menu.dart';

class ShowGerobakDetail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ShowGerobakDetailState();
  }
}

class ShowGerobakDetailState extends State<ShowGerobakDetail> {
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

  onSortColumn(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      if (ascending) {
        menus.sort((a, b) => a.namaMenu.compareTo(b.namaMenu));
      } else {
        menus.sort((a, b) => b.namaMenu.compareTo(a.namaMenu));
      }
    }
  }

  Widget _isiGerobak() {
    return Container(
      color: Theme.of(context).primaryColor,
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          SizedBox(height: 90),
          Text(
            "Detail Gerobak",
            style: Theme.of(context).textTheme.headline5,
          ),
          Text("Fotonya"),
          Text(
            "Sate Padang Mba Nadia",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Text(
            "Tipe Makanan",
            style: Theme.of(context).textTheme.headline4,
          ),
          Text(
            "Rating",
            style: Theme.of(context).textTheme.headline4,
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _detailMenu() {
    return DataTable(
      sortAscending: sort,
      sortColumnIndex: 0,
      columns: [
        DataColumn(
          label: Text("Nama Menu"),
          numeric: false,
          tooltip: "Nama Makanan",
          onSort: (columnIndex, ascending) {
            setState(
              () {
                sort = !sort;
              },
            );
            onSortColumn(columnIndex, ascending);
          },
        ),
        DataColumn(
          label: Text("Harga"),
          numeric: true,
          tooltip: "Harga Makanan",
        ),
      ],
      rows: menus
          .map(
            (menu) => DataRow(
              cells: [
                DataCell(
                  Text(menu.namaMenu),
                ),
                DataCell(
                  Text(menu.hargaMenu),
                ),
              ],
            ),
          )
          .toList(),
    );
  }

  Widget _tambahMenu() {
    return FlatButton(
      color: Color(0xFFF9BF3B),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Text(
        ' Pesan',
        style: Theme.of(context).textTheme.headline2,
      ), // Text
      onPressed: () {},
    );
  }

  Widget _buildStatusAvailibilitas() {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Radio(
            value: antar,
            onChanged: (bool value) {
              setState(
                () {
                  antar = value;
                },
              );
            },
          ),
          Text(
            "Antar",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Radio(
            value: jemput,
            onChanged: (bool value) {
              setState(
                () {
                  jemput = value;
                },
              );
            },
          ),
          Text(
            "Jemput",
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              _isiGerobak(),
              _detailMenu(),
              _buildStatusAvailibilitas(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
        child: _tambahMenu(),
      ),
    );
  }
}

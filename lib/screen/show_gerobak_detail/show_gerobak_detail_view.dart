import 'package:first_app/model/model.dart';
import 'package:first_app/theme/button.dart';
import 'package:flutter/material.dart';

import 'package:first_app/object/menu.dart';

class ShowGerobakDetail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ShowGerobakDetailState();
  }
}

class ShowGerobakDetailState extends ShowGerobakDetailModel {
  Widget _isiGerobak() {
    return Container(
      color: Theme.of(context).primaryColor,
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          SizedBox(height: 90),
          Text(
            "Detail Gerobak",
            key: Key('Text DetailGerobakDetail'),
            style: Theme.of(context).textTheme.headline5,
          ),
          Text("Fotonya"),
          Text(
            "Sate Padang Mba Nadia",
            key: Key('Text NamaGerobakDetail'),
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Text(
            "Tipe Makanan",
            key: Key('Text TipeMakananDetail'),
            style: Theme.of(context).textTheme.headline4,
          ),
          Text(
            "Rating",
            key: Key('Text RatingDetail'),
            style: Theme.of(context).textTheme.headline4,
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _detailMenu() {
    return DataTable(
      key: Key('Table DataTableDetail'),
      sortAscending: sort,
      sortColumnIndex: 0,
      columns: [
        DataColumn(
          label: Text("Nama Menu"),
          numeric: false,
          tooltip: "Nama Makanan",
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
    return TextButton(
      key: Key('Button PesanDetail'),
      style: primaryButtonStyle(),
      onPressed: () {},
      child: Text(
        ' Pesan',
        style: Theme.of(context).textTheme.headline2,
      ), // Text
    );
  }

  Widget _buildStatusAvailibilitas() {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Radio(
            key: Key('Radio AntarDetail'),
            value: antar,
            groupValue: null,
          ),
          Text(
            "Antar",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Radio(
            key: Key('Radio JemputDetail'),
            value: jemput,
            groupValue: null,
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

import 'package:gerobak_flutter/model/akbar_model.dart';
import 'package:gerobak_flutter/object/gerobak.dart';
import 'package:gerobak_flutter/object/menu.dart';
import 'package:gerobak_flutter/theme/button.dart';
import 'package:flutter/material.dart';

class ShowGerobakDetail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ShowGerobakDetailState();
  }
}

class ShowGerobakDetailState extends ShowGerobakDetailModel {
  Widget _isiGerobak(String textNama, String fotoGer, String textTipeMakan) {
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
          Text(fotoGer),
          Text(
            textNama,
            key: Key('Text NamaGerobakDetail'),
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Text(
            textTipeMakan,
            key: Key('Text TipeMakananDetail'),
            style: Theme.of(context).textTheme.headline4,
          ),
          Text(
            "Ratingg",
            key: Key('Text RatingDetail'),
            style: Theme.of(context).textTheme.headline4,
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _detailMenu(List<Menu> listMenu) {
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
      rows: listMenu
          .map(
            (menu) => DataRow(
              cells: [
                DataCell(
                  Text(menu.namaMenu),
                ),
                DataCell(
                  Text(menu.harga.toString()),
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

  Widget _buildStatusAvailibilitas(bool antar, bool jemput) {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Radio(
            key: Key('Radio AntarDetail'),
            value: antar,
            groupValue: theGroupValue,
            onChanged: (value) {
              theGroupValue = value;
            },
          ),
          Text(
            "Antar",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Radio(
            key: Key('Radio JemputDetail'),
            value: jemput,
            groupValue: theGroupValue,
            onChanged: (value) {
              theGroupValue = value;
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
      body: FutureBuilder<Gerobak>(
          future: gerobakDownload,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      _isiGerobak(
                        snapshot.data.namaGerobak,
                        snapshot.data.fotoGerobak,
                        snapshot.data.tipeMakanan,
                      ),
                      _detailMenu(
                        snapshot.data.listMenu,
                      ),
                      _buildStatusAvailibilitas(
                        snapshot.data.statusAntar,
                        snapshot.data.statusJemput,
                      ),
                    ],
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return Center(child: Text('Loading...'));
          }),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
        child: _tambahMenu(),
      ),
    );
  }
}

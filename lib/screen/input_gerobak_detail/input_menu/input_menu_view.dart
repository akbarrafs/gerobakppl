import 'package:gerobak_flutter/model/akbar_model.dart';
import 'package:gerobak_flutter/screen/input_gerobak_detail/input_gerobak/input_gerobak_view.dart';
import 'package:gerobak_flutter/controller/controller.dart';
import 'package:gerobak_flutter/screen/input_gerobak_detail/input_menu/input_menu_form.dart';
import 'package:gerobak_flutter/theme/all_items.dart';
import 'package:gerobak_flutter/theme/button.dart';
import 'package:flutter/material.dart';
import 'package:gerobak_flutter/object/menu.dart';

class InputMenuPage extends StatefulWidget {
  final String namaGerobak;
  final String foto;
  final String tipeMakanan;
  final bool antar;
  final bool jemput;

  InputMenuPage(
      this.namaGerobak, this.foto, this.tipeMakanan, this.antar, this.jemput);

  @override
  State<StatefulWidget> createState() {
    return InputMenuPageState();
  }
}

class InputMenuPageState extends InputMenuPageModel {
  List<InputMenuForm> menus = [];

  void onDelete(Menu theMenu) {
    setState(() {
      var find = menus.firstWhere(
        (it) => it.menu == theMenu,
        orElse: () => null,
      );
      if (find != null) {
        menus.removeAt(menus.indexOf(find));
      }
    });
  }

  void onAddForm() {
    setState(() {
      var theMenu = Menu();
      menus.add(InputMenuForm(
        menu: theMenu,
        onDelete: () => onDelete(theMenu),
      ));
    });
  }

  Widget _tambahMenu() {
    return TextButton(
      key: Key('TextButton TambahMenu'),
      style: primaryButtonStyle(),
      child: Text(
        ' + Tambah Menu',
        key: Key('Text TambahMenu'),
        style: Theme.of(context).textTheme.headline2,
      ),
      onPressed: () {
        onAddForm();
      },
    );
  }

  Widget _actionButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Flexible(
          child: TextButton(
            key: Key('TextButton Kembali'),
            style: secondaryButtonStyle(),
            child: Text(
              'Kembali',
              key: Key('Text Kembali'),
              style: Theme.of(context).textTheme.headline3,
            ),
            onPressed: () {
              pushNavigate(context, InputGerobak());
            },
          ),
        ),
        Flexible(
          child: TextButton(
            key: Key('TextButton Simpan'),
            style: primaryButtonStyle(),
            child: Text(
              'Simpan',
              key: Key('Text Simpan'),
              style: Theme.of(context).textTheme.headline2,
            ),
            onPressed: () {
              var data = menus.map((it) => it.menu).toList();
              simpan(
                '',
                widget.namaGerobak,
                'anjsasdaq',
                widget.tipeMakanan,
                widget.antar,
                widget.jemput,
                data,
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _fieldMenu() {
    return ListView.builder(
      key: Key('ListView FieldMenu'),
      itemCount: menus.length,
      itemBuilder: (context, i) => menus[i],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: theAppBar(),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
        child: Column(
          children: <Widget>[
            Text(
                "Sedikit lagi, Para Penjual! Mari masukkan menu yang Anda ingin jual!",
                key: Key('Text MasukkanMenu'),
                style: Theme.of(context).textTheme.bodyText2),
            menus.length <= 0
                ? Center()
                : Expanded(
                    child: _fieldMenu(),
                  ),
            _tambahMenu(),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 70.0, vertical: 30),
        // child: _tambahMenu(),
        child: _actionButton(),
      ),
    );
  }
}

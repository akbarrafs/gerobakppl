import 'package:first_app/controller/controller.dart';
import 'package:first_app/screen/input_gerobak/input_gerobak.dart';
import 'package:first_app/screen/show_gerobak_detail/show_gerobak_detail.dart';
import 'package:first_app/theme/all_items.dart';
import 'package:flutter/material.dart';
import 'package:first_app/object/menu.dart';
import 'package:first_app/screen/input_menu/input_menu_form.dart';

class InputMenuPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return InputMenuPageState();
  }
}

class InputMenuPageState extends State<InputMenuPage> {
  List<Menu> menus = [];

  void onDelete(int id) {
    setState(() {
      menus.removeAt(id);
    });
  }

  void onAddForm() {
    setState(() {
      this.menus.add(Menu());
    });
  }

  Widget _tambahMenu() {
    return FlatButton(
      color: Color(0xFFF9BF3B),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Text(
        ' + Tambah Menu',
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
          child: FlatButton(
            color: Color(0xFF1C2A39),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Text(
              'Kembali',
              style: Theme.of(context).textTheme.headline3,
            ),
            onPressed: () {
              pushNavigate(context, InputGerobakScreen());
            },
          ),
        ),
        Flexible(
          child: FlatButton(
            color: Color(0xFFF9BF3B),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Text(
              'Simpan',
              style: Theme.of(context).textTheme.headline2,
            ),
            onPressed: () {
              pushNavigate(context, ShowGerobakDetailScreen());
            },
          ),
        ),
      ],
    );
  }

  Widget _fieldMenu() {
    return ListView.builder(
      itemCount: menus.length,
      itemBuilder: (_, i) => InputMenuForm(
        menu: menus[i],
        onDelete: () => onDelete(i),
      ),
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

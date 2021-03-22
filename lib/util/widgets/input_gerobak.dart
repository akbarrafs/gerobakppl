import 'dart:io';

import 'package:first_app/util/template/all_items.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'input_menu_page.dart';

class InputGerobak extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return InputGerobakState();
  }
}

class InputGerobakState extends State<InputGerobak> {
  String namaGerobak;
  File foto;
  String tipeMakanan;
  bool antar;
  bool jemput;

  void initState() {
    antar = false;
    jemput = false;
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final picker = ImagePicker();

  Widget _buildNamaGerobak() {
    return TextFormField(
      style: Theme.of(context).textTheme.headline6,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).accentColor,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Nama gerobak harus diisi!';
        }
      },
      onSaved: (String value) {
        namaGerobak = value;
      },
    );
  }

  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Gambar dari.."),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                    child: Text("Gallery"),
                    onTap: () {
                      _openGallery(context);
                    }),
                Padding(padding: EdgeInsets.all(8.0)),
                GestureDetector(
                  child: Text("Camera"),
                  onTap: () {
                    _openCamera(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  _openGallery(BuildContext context) async {
    var picture = await picker.getImage(source: ImageSource.gallery);
    this.setState(
      () {
        foto = File(picture.path);
      },
    );
    Navigator.of(context).pop();
  }

  _openCamera(BuildContext context) async {
    var picture = await picker.getImage(source: ImageSource.camera);
    this.setState(
      () {
        foto = File(picture.path);
      },
    );
    Navigator.of(context).pop();
  }

  Widget _buildFoto() {
    return FlatButton(
      color: Theme.of(context).primaryColor,
      onPressed: () {
        _showChoiceDialog(context);
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Text(
        "Upload Gambar",
        style: Theme.of(context).textTheme.headline2,
      ),
    );
  }

  Widget _imageView() {
    if (foto == null) {
      return _buildFoto();
    } else {
      return ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: Image.file(foto, width: 300, height: 300, fit: BoxFit.contain),
      );
    }
  }

  Widget _buildTipeMakanan() {
    return TextFormField(
      style: Theme.of(context).textTheme.headline6,
      decoration: InputDecoration(
        // floatingLabelBehavior: FloatingLabelBehavior.always,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).accentColor,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Tipe Makanan harus diisi!';
        }
      },
      onSaved: (String value) {
        tipeMakanan = value;
      },
    );
  }

  Widget _buildStatusAvailibilitas() {
    return Row(
      children: <Widget>[
        Checkbox(
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
        Checkbox(
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
    );
  }

  Widget _greyText(String text) {
    Text greyText = new Text(
      text,
      style: Theme.of(context).textTheme.bodyText2,
    );
    return greyText;
  }

  Future<void> _showInformation(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Informasi"),
          content: _greyText(
              "Antar : Dimana Anda mendatangi pembeli secara langsung.\nJemput : Dimana pembeli mendatangi Anda untuk mengambil pesanan."),
        );
      },
    );
  }

  Widget _infoButton() {
    return IconButton(
      onPressed: () {
        _showInformation(context);
      },
      icon: Icon(
        IconData(62069, fontFamily: 'MaterialIcons'),
      ),
      iconSize: 20.0,
      tooltip: "Informasi",
    );
  }

  Widget _submitButton() {
    return FlatButton(
      color: Color(0xFFF9BF3B),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Text(
        'Selanjutnya',
        style: Theme.of(context).textTheme.headline2,
      ), // Text
      onPressed: () {
        if (!_formKey.currentState.validate()) {
          return;
        }
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => InputMenuPage()));
        _formKey.currentState.save();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: theAppBar(),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _greyText(
                  "Selamat Datang, Para Penjual! Mari masukkan detil Gerobak Anda untuk memulai menggunakan semua fitur Kami!",
                ),
                SizedBox(height: 5),
                Text(
                  "Nama Gerobak",
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                SizedBox(height: 5),
                _buildNamaGerobak(),
                SizedBox(height: 20),
                Text(
                  "Foto Gerobak",
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                SizedBox(height: 5),
                _imageView(),
                SizedBox(height: 20),
                Text(
                  "Tipe Makanan",
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                SizedBox(height: 5),
                _buildTipeMakanan(),
                SizedBox(height: 20),
                Row(
                  children: <Widget>[
                    Text(
                      "Status Availibilitas",
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    _infoButton(),
                  ],
                ),
                SizedBox(height: 5),
                _buildStatusAvailibilitas(),
                SizedBox(height: 20),
                _submitButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

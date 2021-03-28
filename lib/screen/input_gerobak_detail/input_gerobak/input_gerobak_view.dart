import 'dart:io';

import 'package:gerobak_flutter/controller/controller.dart';
import 'package:gerobak_flutter/model/gerobak_detail_model.dart';
import 'package:gerobak_flutter/screen/input_gerobak_detail/input_menu/input_menu.dart';
import 'package:gerobak_flutter/theme/all_items.dart';
import 'package:gerobak_flutter/theme/button.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class InputGerobak extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return InputGerobakState();
  }
}

class InputGerobakState extends InputGerobakModel {
  Widget _buildNamaGerobak() {
    return TextFormField(
      key: Key('TextFormField namaGerobak'),
      controller: namaGerobakCont,
      style: Theme.of(context).textTheme.headline6,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).accentColor,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      validator: NamaFieldValidator.validate,
    );
  }

  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          key: Key('Dialog Upload Choice'),
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
                TextButton(
                  key: Key('TextButton Close'),
                  style: primaryButtonStyle(),
                  child: Text(
                    'Close',
                    style: Theme.of(context).textTheme.headline2,
                  ), // Text
                  onPressed: () {
                    Navigator.of(context).pop();
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
    return TextButton(
      key: Key('TextButton Upload'),
      style: primaryButtonStyle(),
      onPressed: () {
        _showChoiceDialog(context);
      },
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
        child: Image.file(
          foto,
          width: 300,
          height: 300,
          fit: BoxFit.contain,
          key: Key('Image Gerobak'),
        ),
      );
    }
  }

  Widget _buildTipeMakanan() {
    return TextFormField(
      key: Key('TextFormField tipeMakanan'),
      controller: tipeMakananCont,
      style: Theme.of(context).textTheme.headline6,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).accentColor,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      validator: TipeMakananFieldValidator.validate,
    );
  }

  Widget _buildStatusAvailibilitas() {
    return Row(
      children: <Widget>[
        Checkbox(
          key: Key('Checkbox Antar'),
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
          key: Key('Checkbox Jemput'),
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
      key: Key('Text Secondary'),
      style: Theme.of(context).textTheme.bodyText2,
    );
    return greyText;
  }

  Future<void> _showInformation(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          key: Key('Dialog Informasi'),
          title: Text("Informasi"),
          content: _greyText(
              "Antar : Dimana Anda mendatangi pembeli secara langsung.\nJemput : Dimana pembeli mendatangi Anda untuk mengambil pesanan."),
        );
      },
    );
  }

  Widget _infoButton() {
    return IconButton(
      key: Key('TextButton Informasi'),
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
    return TextButton(
      key: Key('TextButton Submit'),
      style: primaryButtonStyle(),
      child: Text(
        'Selanjutnya',
        style: Theme.of(context).textTheme.headline2,
      ), // Text
      onPressed: () {
        if (!formKey.currentState.validate()) {
          pushNavigate(context, InputMenuScreen());
        }
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
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _greyText(
                  "Selamat Datang, Para Penjual! Mari masukkan detil Gerobak Anda untuk memulai menggunakan semua fitur Kami!",
                ),
                SizedBox(height: 5),
                Text(
                  "Nama Gerobak",
                  key: Key('Text NamaGerobak'),
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                SizedBox(height: 5),
                _buildNamaGerobak(),
                SizedBox(height: 20),
                Text(
                  "Foto Gerobak",
                  key: Key('Text FotoGerobak'),
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                SizedBox(height: 5),
                _imageView(),
                SizedBox(height: 20),
                Text(
                  "Tipe Makanan",
                  textAlign: TextAlign.left,
                  key: Key('Text TipeMakanan'),
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                SizedBox(height: 5),
                _buildTipeMakanan(),
                SizedBox(height: 20),
                Row(
                  children: <Widget>[
                    Text(
                      "Status Availibilitas",
                      key: Key('Text Status'),
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

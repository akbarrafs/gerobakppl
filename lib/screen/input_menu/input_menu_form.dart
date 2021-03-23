import 'package:flutter/material.dart';
import 'package:first_app/object/menu.dart';

typedef OnDelete();

class InputMenuForm extends StatefulWidget {
  final Menu menu;
  final state = InputMenuFormState();
  final OnDelete onDelete;

  InputMenuForm({this.menu, this.onDelete});
  @override
  State<StatefulWidget> createState() {
    return InputMenuFormState();
  }
}

class InputMenuFormState extends State<InputMenuForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Widget _fieldMenu() {
    return Row(
      children: <Widget>[
        Flexible(
          child: Column(
            children: <Widget>[
              Text(
                "Menu",
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              TextFormField(
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
                    return 'Menu harus diisi!';
                  }
                },
                onSaved: (String value) {
                  // namaGerobak = value;
                },
              ),
            ],
          ),
        ),
        Flexible(
          child: Column(
            children: <Widget>[
              Text(
                "Harga",
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              TextFormField(
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
                    return 'Harga harus diisi!';
                  }
                },
                onSaved: (String value) {
                  // namaGerobak = value;
                },
              ),
            ],
          ),
        ),
        Flexible(
          child: Column(
            children: <Widget>[
              Text(
                "Hapus",
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              IconButton(
                onPressed: () {
                  widget.onDelete();
                },
                icon: Icon(
                  IconData(61818, fontFamily: 'MaterialIcons'),
                  color: Colors.red,
                ),
                iconSize: 20.0,
                tooltip: "Hapus",
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Card(
            color: Colors.transparent,
            elevation: 0.0,
            child: Form(
              key: _formKey,
              child: _fieldMenu(),
            ),
          ),
        ],
      ),
    );
  }
}

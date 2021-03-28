import 'package:gerobak_flutter/screen/input_gerobak_detail/input_gerobak/input_gerobak_view.dart';
import 'package:gerobak_flutter/theme/all_items.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: theAppBar(),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                "Input Detail Gerobak Disini",
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              SizedBox(height: 5),
              _pindahButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _pindahButton() {
    return RaisedButton(
      color: Color(0xFFF9BF3B),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Text(
        'Detail Gerobak',
        style: Theme.of(context).textTheme.headline2,
      ),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => InputGerobak()));
      },
    );
  }
}

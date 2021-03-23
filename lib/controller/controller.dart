import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

Future pushNavigate(BuildContext context, Widget route) {
  return Navigator.push(context, MaterialPageRoute(builder: (context) {
    return route;
  }));
}

TapGestureRecognizer onTapGesture(BuildContext context, Widget route) {
  return TapGestureRecognizer()
    ..onTap = () {
      pushNavigate(context, route);
    };
}

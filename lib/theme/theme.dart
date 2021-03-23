import 'package:flutter/material.dart';
import 'package:first_app/theme/color.dart';

ThemeData basicTheme() {
  TextTheme _basicTextTheme(TextTheme base) {
    return base.copyWith(
      bodyText1: base.bodyText1.copyWith(
        color: black,
        fontFamily: 'Nunito-ExtraBold',
        fontSize: 18.0,
      ),
      headline6: base.headline6.copyWith(
        height: 0.2,
      ),
      headline1: base.headline1.copyWith(
        fontFamily: 'Nunito-ExtraBold',
        fontSize: 50,
        color: black,
      ),
      bodyText2: base.bodyText2.copyWith(
        color: black,
        fontFamily: 'Nunito-Regular',
        fontSize: 16,
      ),
      headline2: base.headline2.copyWith(
        fontFamily: 'Nunito-ExtraBold',
        fontSize: 16,
        color: black,
      ),
      headline3: base.headline3.copyWith(
        fontFamily: 'Nunito-ExtraBold',
        fontSize: 16,
        color: yellow,
      ),
      headline4: base.headline4.copyWith(
        fontFamily: 'Nunito-SemiBold',
        fontSize: 12,
        color: black,
      ),
      headline5: base.headline5.copyWith(
        fontFamily: 'Nunito-Bold',
        fontSize: 16,
        color: black,
      ),
    );
  }

  final ThemeData base = ThemeData.light();
  return base.copyWith(
    textTheme: _basicTextTheme(base.textTheme),
    primaryColor: yellow,
    accentColor: black,
  );
}

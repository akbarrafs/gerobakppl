import 'package:flutter/material.dart';

ThemeData basicTheme() {
  TextTheme _basicTextTheme(TextTheme base) {
    return base.copyWith(
      bodyText1: base.bodyText1.copyWith(
        color: Color(0xFF1C2A39),
        fontFamily: 'Nunito-ExtraBold',
        fontSize: 18.0,
      ),
      headline6: base.headline6.copyWith(
        height: 0.2,
      ),
      headline1: base.headline1.copyWith(
        fontFamily: 'Nunito-ExtraBold',
        fontSize: 50,
        color: Color(0xFF1C2A39),
      ),
      bodyText2: base.bodyText2.copyWith(
        color: Color(0xFF1C2A39),
        fontFamily: 'Nunito-Regular',
        fontSize: 16,
      ),
      headline2: base.headline2.copyWith(
        fontFamily: 'Nunito-ExtraBold',
        fontSize: 16,
        color: Color(0xFF1C2A39),
      ),
      headline3: base.headline3.copyWith(
        fontFamily: 'Nunito-ExtraBold',
        fontSize: 16,
        color: Color(0xFFF9BF3B),
      ),
      headline4: base.headline4.copyWith(
        fontFamily: 'Nunito-SemiBold',
        fontSize: 12,
        color: Color(0xFF1C2A39),
      ),
      headline5: base.headline5.copyWith(
        fontFamily: 'Nunito-Bold',
        fontSize: 16,
        color: Color(0xFF1C2A39),
      ),
    );
  }

  final ThemeData base = ThemeData.light();
  return base.copyWith(
    textTheme: _basicTextTheme(base.textTheme),
    primaryColor: Color(0xFFF9BF3B),
    accentColor: Color(0xFF1C2A39),
  );
}

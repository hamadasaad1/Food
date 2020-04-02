import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'const_color.dart';

class AppTheme{

  AppTheme._();

  static const Color appBackgroundColor=PrimaryDarkColor;
  static const Color topBarBackgroundColor=PrimaryColor;
  static const Color selectedTabBackgroundColor=PrimaryDarkColor;
  static const Color UnSelectedBackgroundColor=Color(0xFFFFFFfC);
  static const Color subTitleTexColor=Color(0xFF9F988F);

  static final ThemeData lightTheme=ThemeData(
  //  scaffoldBackgroundColor: AppTheme.appBackgroundColor,
    brightness: Brightness.light,
    textTheme: lightTextTheme,
    primaryColor: PrimaryLightColor,
    accentColor: AccentColor,
    primaryColorDark: PrimaryDarkColor,
    primaryColorLight: PrimaryLightColor
  );
  static final ThemeData darkTheme=ThemeData(
      scaffoldBackgroundColor: Colors.black,
      brightness: Brightness.dark,
      textTheme: darkTextTheme
  );


  static final TextTheme lightTextTheme=TextTheme(

    title: _lightTextStyle,
    subtitle:_lightSubTitleStyle ,
    button: _lightButtonStyle,
  );

  static final TextTheme darkTextTheme=TextTheme(
    title: _darkTextStyle,
    subtitle: _darkSubTitleStyle,
    button: _darkButtonStyle,
  );

  static final TextStyle _lightTextStyle=TextStyle(
    color: Colors.black,
    fontSize: 28
  );

  static final TextStyle _lightSubTitleStyle=TextStyle(
      color: subTitleTexColor,
      fontSize: 18,
      height: 1.5
  );
  static final TextStyle _lightButtonStyle=TextStyle(
      color: Colors.black,
      fontSize: 22
  );


  static final TextStyle _darkTextStyle=TextStyle(
      color: Colors.white,
      fontSize: 28
  );

  static final TextStyle _darkSubTitleStyle=TextStyle(
      color: Colors.white70,
      fontSize: 18,
      height: 1.5
  );
  static final TextStyle _darkButtonStyle=TextStyle(
     // color: Colors.white,
      fontSize: 22
  );

}
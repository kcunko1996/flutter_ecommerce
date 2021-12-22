import 'package:flutter/material.dart';
import 'package:flutter_exommerce/constants.dart';
import 'package:flutter_exommerce/size_config.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: appbarTheme(),
    fontFamily: 'Muli',
    inputDecorationTheme: inputDecorationtheme(),
    textTheme: textTheme(),
    primarySwatch: Colors.blue,
  );
}

InputDecorationTheme inputDecorationtheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(28),
      borderSide: BorderSide(
        color: kTextColor,
      ),
      gapPadding: 10);
  return InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 18),
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder);
}

TextTheme textTheme() {
  return TextTheme(
    bodyText1: TextStyle(color: kTextColor),
    bodyText2: TextStyle(color: kTextColor),
  );
}

AppBarTheme appbarTheme() {
  return AppBarTheme(
      color: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(color: Color(0xFF8B8B8B), fontSize: 18));
}

import 'package:flutter/material.dart';

const dartBlack = Color(0xFF323232);
const black = Color(0xFF424242);
const lightBlack = Color(0xFF565656);

const lightGrey = Color(0xFFDBDBDB);
const dartGrey = Color(0xFFA4A4A4);

const lightBlue = Color(0xFF7DB1C7);
ThemeData get customThemeData => ThemeData(
      scaffoldBackgroundColor: dartBlack,
      textTheme: const TextTheme(
        bodyText2: TextStyle(),
      ).apply(
        bodyColor: lightGrey,
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: lightGrey,
        focusColor: lightBlue,
        hoverColor: Colors.red,
      ),
      dividerTheme: const DividerThemeData(
        thickness: 1,
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.all(lightBlue),
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
    );

const darkGrey = Color(0xFF1b2226);
const grey = Color(0xFF8699a6);
const darkBlue = Color(0xFF30414b);
const brown = Color(0xFF9c9486);

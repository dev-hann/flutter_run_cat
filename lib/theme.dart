import 'package:flutter/material.dart';

const dartBlack = Color(0xFF323232);
const black = Color(0xFF424242);
const lightBlack = Color(0xFF565656);

const lightGrey = Color(0xFFDBDBDB);
const dartGrey = Color(0xFFA4A4A4);

const lightYellow = Color(0xFFEFD672);

ThemeData get customThemeData => ThemeData(
      scaffoldBackgroundColor: dartBlack,
      textTheme: const TextTheme(
        bodyText2: TextStyle(),
      ).apply(
        bodyColor: lightGrey,
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: lightGrey,
        focusColor: lightYellow,
        hoverColor: Colors.red,
      ),
      dividerTheme: const DividerThemeData(
        thickness: 1,
      ),
    );

const darkGrey = Color(0xFF1b2226);
const grey = Color(0xFF8699a6);
const darkBlue = Color(0xFF30414b);
const brown = Color(0xFF9c9486);

import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData getTheme() {
    return ThemeData(
        fontFamily: 'Ubuntu',
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: AppTheme.orange,
        ),
        // bottomSheetTheme:
        //     const BottomSheetThemeData(backgroundColor: AppTheme.black),
        primaryColor: orange,
        iconTheme: const IconThemeData(color: orange));
  }

  static const orange = Color(0xFFea8f25);
  static const orangeLight = Color.fromARGB(255, 246, 227, 205);
  static const black = Colors.black;
  static const blackLight = Color.fromARGB(255, 86, 85, 85);
  static const white = Colors.white;
  static const yellow = Color(0xffffc727);
  static const grey = Color(0xffC4C4C4);
  static const greyLight = Color.fromARGB(255, 243, 238, 238);
  static const greyDark = Color.fromARGB(255, 115, 114, 114);
  static const blue = Colors.blue;
  static const blueLight = Color.fromARGB(255, 238, 242, 245);
  static const red = Colors.red;
  static const green = Colors.green;
  static const greenLight = Color.fromARGB(255, 221, 240, 222);
  static const purple = Colors.purple;
  static const purpleLight = Color.fromARGB(255, 208, 105, 245);
  static const navy = Color(0xff4527FF);
  static const navyLight = Color(0xff7D69F5);
}

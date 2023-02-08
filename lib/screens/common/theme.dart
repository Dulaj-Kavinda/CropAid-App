import 'package:flutter/material.dart';

class CropAidThemes {
  static final light = ThemeData.light().copyWith(
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              primary: const Color.fromARGB(255, 2, 70, 2))),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          primary: const Color.fromARGB(255, 2, 70, 2),
        ),
      ),
      textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Color.fromARGB(255, 2, 70, 2)),
      inputDecorationTheme: const InputDecorationTheme(
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 2, 70, 2))),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 2, 70, 2)),
        ),
      ));

  static const titleTextTheme = TextStyle(
      color: Color.fromARGB(255, 20, 9, 119),
      fontFamily: "Poppins",
      fontSize: 20,
      // fontWeight: FontWeight.bold
      fontWeight: FontWeight.w600
  );

  static const subTextTheme = TextStyle(
      fontSize: 15,
      // fontWeight: FontWeight.bold,
      fontWeight: FontWeight.w600,
      color: Color.fromARGB(255, 97, 97, 99),
      fontFamily: "Poppins"
  );

  static const mainTextTheme = TextStyle(
      fontSize: 15,
      // fontWeight: FontWeight.bold,
      fontWeight: FontWeight.w600,
      color: Color.fromARGB(255, 8, 8, 56),
      fontFamily: "Poppins");

  static const buttonTextTheme = TextStyle(
    fontSize: 15,
    fontFamily: "Poppins",
    color: Colors.white,
    // fontWeight: FontWeight.bold,
    fontWeight: FontWeight.w600,
  );
}

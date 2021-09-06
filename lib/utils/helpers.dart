

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Helpers {
  static getWidthPageSize(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static getHeightPageSize(BuildContext context) =>
      MediaQuery.of(context).size.height;


  static MaterialColor generateMaterialColor(Color color) {
    return MaterialColor(color.value, {
      50: tintColor(color, 0.9),
      100: tintColor(color, 0.8),
      200: tintColor(color, 0.6),
      300: tintColor(color, 0.4),
      400: tintColor(color, 0.2),
      500: color,
      600: shadeColor(color, 0.1),
      700: shadeColor(color, 0.2),
      800: shadeColor(color, 0.3),
      900: shadeColor(color, 0.4),
    });
  }

  static int tintValue(int value, double factor) =>
      max(0, min((value + ((255 - value) * factor)).round(), 255));

  static Color tintColor(Color color, double factor) => Color.fromRGBO(
      tintValue(color.red, factor),
      tintValue(color.green, factor),
      tintValue(color.blue, factor),
      1);

  static int shadeValue(int value, double factor) =>
      max(0, min(value - (value * factor).round(), 255));

  static Color shadeColor(Color color, double factor) => Color.fromRGBO(
      shadeValue(color.red, factor),
      shadeValue(color.green, factor),
      shadeValue(color.blue, factor),
      1);


  static showSnackBar(BuildContext context, {
    required SnackBarMode snackBarMode,
    required String content,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        content,
        style: GoogleFonts.inter(
            color: snackBarMode == SnackBarMode.SUCCESS ? Color(0xff22AA5F) : Color(0xffB61616)
        ),
      ),
      duration: Duration(milliseconds: 6000),
      backgroundColor: snackBarMode == SnackBarMode.SUCCESS ? Color(0xffAAEEC9) : Color(0xffFFB7B7),
      behavior: SnackBarBehavior.floating,
      shape:  RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(9)
      ) ,
    ));
  }

}

enum SnackBarMode {
  ERROR,
  SUCCESS
}
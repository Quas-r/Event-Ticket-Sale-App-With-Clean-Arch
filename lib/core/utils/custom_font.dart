import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


List<BoxShadow> get normalShadow {
  return [
    BoxShadow(
      offset: const Offset(0, 3),
      spreadRadius: 1,
      blurRadius: 3,
      color: Colors.black.withOpacity(0.1)
    ),
  ];
}

TextStyle customFont({
  double? fontSize,
  FontWeight? fontWeight,
  Color? color,
  FontStyle? fontStyle,
  TextDecoration? decoration,
  double? letterSpacing,
  bool shadow = false,
}) {
  return GoogleFonts.montserrat(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
    fontStyle: fontStyle,
    decoration: decoration,
    letterSpacing: letterSpacing,
    shadows: shadow
        ? const <Shadow>[
            Shadow(
              offset: Offset(2.0, 2.0),
              blurRadius: 3.0,
              color: Colors.grey,
            ),
          ]
        : null,
  );
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppFonts {
  static TextStyle smallWhite = GoogleFonts.nunito(
    textStyle: const TextStyle(
      fontSize: 12,
      color: Color.fromARGB(255, 255, 255, 255),
      fontWeight: FontWeight.w300,
    ),
  );


  static TextStyle bodyText = GoogleFonts.nunito(
    textStyle: const TextStyle(
      fontSize: 12,
      color: Pallete.text,
      fontWeight: FontWeight.w300,
    ),
  );
    static TextStyle cancel = GoogleFonts.nunito(
    textStyle: const TextStyle(
      fontSize: 12,
      color: Color(0xFFFF3737),
      fontWeight: FontWeight.w300,
    ),
  );

    static TextStyle body1 = GoogleFonts.nunito(
    textStyle: const TextStyle(
      fontSize: 12,
      color: Color.fromARGB(255, 146, 146, 146),
      fontWeight: FontWeight.w300,
    ),
  );
  static TextStyle headerBlack = GoogleFonts.nunito(
    textStyle: const TextStyle(
      fontSize: 18,
      color: Color.fromARGB(255, 0, 0, 0),
      fontWeight: FontWeight.bold,
    ),
  );
    static TextStyle smallWhiteBold = GoogleFonts.nunito(
    textStyle: const TextStyle(
      fontSize: 14,
      color: Color.fromARGB(255, 255, 255, 255),
      fontWeight: FontWeight.bold,
    ),
  );
}

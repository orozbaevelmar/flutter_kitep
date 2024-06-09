import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MTextStyle {
  static const appBarTextStyle = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 18,
    height: 21.78 / 18,
    color: Color(0xFF1E1E1E),
  );

  static TextStyle ui_16Semi(Color color) {
    return GoogleFonts.inter(
      textStyle: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 16,
        height: 19.36 / 16,
        color: color,
      ),
    );
  }

  static TextStyle ui_16Medium(Color color) {
    return GoogleFonts.inter(
      textStyle: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 16,
        height: 19.36 / 16,
        color: color,
      ),
    );
  }

  static TextStyle ui_14Regular(Color color) {
    return GoogleFonts.inter(
      textStyle: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        height: 16.94 / 14,
        color: color,
      ),
    );
  }

  static TextStyle h3_14Regular(Color color) {
    return GoogleFonts.roboto(
      textStyle: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        height: 16.41 / 14,
        color: color,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class mycolors {
  static Color PrimaryColor = Color.fromRGBO(39, 22, 231, 1.0);
  static Color SecondaryColor = Color.fromRGBO(128, 162, 250, 1.0);
  static Color blackColor = Colors.black;
  static Color whiteColor = Colors.white;
  static Color greyColor = Color.fromARGB(255, 196, 193, 193);
  static Color BiruMuda = Color.fromARGB(255, 195, 197, 206);

  TextStyle BoldTextStyle = GoogleFonts.poppins(
      fontSize: 14, color: blackColor, fontWeight: FontWeight.bold);
  TextStyle NormalTextStyle = GoogleFonts.poppins(
      fontSize: 14, color: blackColor, fontWeight: FontWeight.normal);
  TextStyle BlueTextStyle = GoogleFonts.poppins(
      fontSize: 14, color: PrimaryColor, fontWeight: FontWeight.normal);
  TextStyle semibold = GoogleFonts.poppins(
    fontWeight: FontWeight.w600,
  );

  static Color purple = Color(0xFF6E5DE7);
  static Color background = Color(0xFFF6F9FF);
  static Color darkGrey = Color(0xFFBFBFBF);
  static Color grey = Color(0xFFC7C9D9);
  static Color darkerBlack = Color(0xFF404040);
  static Color lineStroke = Color(0xFFDDE5E9);
  static Color backgroundBlue = Color(0xFFC9E7FF);
  static Color subtleRed = Color(0xFFE28173);
  static Color lighRed = Color(0xFFFF6A88);

  TextStyle regular = GoogleFonts.poppins(
    fontWeight: FontWeight.w400,
  );

  TextStyle medium = GoogleFonts.poppins(
    fontWeight: FontWeight.w500,
  );

  TextStyle bold = GoogleFonts.poppins(
    fontWeight: FontWeight.w700,
  );
}

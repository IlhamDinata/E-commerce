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
}

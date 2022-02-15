import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class Styles {
  static const kScaffold = Color(0xFF191A1C);
  static const kPrimary = Color(0xFF6242E2);
  static const kRadius = BorderRadius.all(Radius.circular(10));
  static const kPadding = EdgeInsets.all(20);

  static final kTitle = GoogleFonts.lato(
    fontSize: 21,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  static final kSubtitle = GoogleFonts.lato(
    fontSize: 16,
    color: Colors.white,
  );
}

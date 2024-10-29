import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

const Color primaryBgColor = Colors.blueGrey;
const Color secondBgColor = Colors.lightBlue;

const Color primaryTextColor = Colors.black;
const Color secondTextColor = Colors.grey;

final textTitle = GoogleFonts.lato(
  fontSize: 25,
  color: primaryTextColor,
  fontWeight: FontWeight.w700,
);

final textSubTitle = GoogleFonts.lato(
  fontSize: 20,
  color: secondTextColor,
  fontWeight: FontWeight.w500,
  fontStyle: FontStyle.italic,
);

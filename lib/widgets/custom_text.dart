import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';

Widget customText({
  required String text,
  TextOverflow? overflow,
  TextDecoration? textDecoration,
  required Color color,
  required double fontSize,
  required FontWeight fontWeight,
  int? maxLines,
}) =>
    Text(text,
        maxLines:maxLines ,
        style: GoogleFonts.akayaTelivigala(
          textStyle: TextStyle(
            overflow: overflow,
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
            decoration: textDecoration,
          ),
        ));

Widget customNumber({
  required String text,
  TextOverflow? overflow,
  TextDecoration? textDecoration,
  required Color color,
  required double fontSize,
  required FontWeight fontWeight,
}) =>
    Text(text,
        style: GoogleFonts.abhayaLibre(
          textStyle: TextStyle(
            overflow: overflow,
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
            decoration: textDecoration,
          ),
        ));
//akronim
//abhayaLibre   number
//aclonica
//alata name

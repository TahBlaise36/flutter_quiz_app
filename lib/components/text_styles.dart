import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles extends StatelessWidget {
  const TextStyles(
    this.text, {
    super.key,
    this.color = const Color.fromARGB(255, 205, 205, 224),
    this.fontSize = 16,
    this.fontWeight = FontWeight.normal,
  });

  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.inter(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}

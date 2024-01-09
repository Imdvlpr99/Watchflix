import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:watchflix/utils/constants.dart';

class RoundedField extends StatelessWidget {
  final Color? backgroundColor;
  final double? borderRadius;
  final double? paddingVertical;
  final double? paddingHorizontal;
  final String? text;
  final Color? textColor;
  final double? textSize;
  final FontWeight? fontWeight;

  const RoundedField({
    super.key,
    this.backgroundColor,
    this.borderRadius,
    this.text,
    this.paddingVertical,
    this.paddingHorizontal,
    this.textColor,
    this.textSize,
    this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 20),
        color: backgroundColor ?? mainColor
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: paddingVertical ?? 2,
            horizontal: paddingHorizontal ?? 5
        ),
        child: Text(
          text ?? '',
          style: GoogleFonts.poppins().copyWith(
            color: textColor ?? Colors.white,
            fontSize: textSize ?? 18,
            fontWeight: fontWeight ?? FontWeight.w600
          ),
        ),
      ),
    );
  }

}
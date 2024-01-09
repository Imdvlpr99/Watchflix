import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:watchflix/utils/constants.dart';

class StarRating extends StatelessWidget {
  final double initialRating;
  final double maxRating;
  final Color? color;
  final Color? starColor;
  final Color? textColor;
  final bool isStarInside;
  final double? starSize;
  final double? borderRadius;
  final double? paddingVertical;
  final double? paddingHorizontal;
  final double? textSize;

  const StarRating({
    super.key,
    required this.initialRating,
    required this.maxRating,
    this.color,
    this.isStarInside = false,
    this.starSize,
    this.borderRadius,
    this.paddingVertical,
    this.paddingHorizontal,
    this.starColor,
    this.textColor,
    this.textSize});

  @override
  Widget build(BuildContext context) {
    return isStarInside == false ? Row(
      children: <Widget> [
        Icon(
          Icons.star,
          size: starSize ?? 20,
          color: starColor ?? Colors.yellow),
        const SizedBox(width: 5),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius ?? 20),
              color: color ?? secondaryColor
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: paddingVertical ?? 5,
                horizontal: paddingHorizontal ?? 10),
            child: Text(
              '${double.parse(initialRating.toStringAsFixed(1))} / ${maxRating.toInt()}',
              style: GoogleFonts.poppins().copyWith(
                  color: textColor ?? Colors.white,
                  fontSize: textSize ?? 12,
                  fontWeight: FontWeight.w600
              ),
            ),
          ),
        )
      ],
    ) :
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius ?? 20),
            color: color ?? secondaryColor
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: paddingVertical ?? 5,
                horizontal: paddingHorizontal ?? 10
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                    Icons.star,
                    size: starSize ?? 20,
                    color: starColor ?? Colors.yellow),
                const SizedBox(width: 5),
                Text(
                  '${double.parse(initialRating.toStringAsFixed(1))} / ${maxRating.toInt()}',
                  style: GoogleFonts.poppins().copyWith(
                      color: textColor ?? Colors.white,
                      fontSize: textSize ?? 12,
                      fontWeight: FontWeight.w600
                  ),
                ),
              ],
            ),
          ),
        )
    ;
  }

}
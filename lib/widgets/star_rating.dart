import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:watchflix/utils/constants.dart';

class StarRating extends StatelessWidget {
  final double initialRating;
  final double maxRating;
  const StarRating({
    super.key,
    required this.initialRating,
    required this.maxRating});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget> [
        const Icon(
          Icons.star,
          size: 20,
          color: Colors.yellow,),
        const SizedBox(width: 5),
        Container(
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: secondaryColor
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 7, bottom: 2),
            child: Text(
              '${double.parse(initialRating.toStringAsFixed(1))} / ${maxRating.toInt()}',
              style: GoogleFonts.poppins().copyWith(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w600
              ),
            ),
          ),
        )
      ],
    );
  }

}
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:watchflix/utils/constants.dart';

class SectionHeader extends StatelessWidget {
  final String headerTitle;
  final String seeAllTitle;
  final Function? onPressed;

  const SectionHeader({
    super.key,
    required this.headerTitle,
    required this.seeAllTitle,
    this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              headerTitle,
              style: GoogleFonts.poppins().copyWith(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),

            GestureDetector(
              onTap: () {
                if (onPressed != null) {
                  onPressed!();
                }
              },
              child: Row(
                children: [
                  Text(
                    seeAllTitle,
                    style: GoogleFonts.poppins().copyWith(
                      color: red,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 5),
                  const Icon(
                    Iconsax.arrow_right_3,
                    size: 20,
                    color: red,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}
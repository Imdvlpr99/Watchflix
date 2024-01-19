import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:watchflix/utils/constants.dart';

class SectionHeader extends StatelessWidget {
  final String leftTitle;
  final String rightTitle;
  final double? leftTitleFontSize;
  final double? rightTitleFontSize;
  final bool? setLeftTitle;
  final bool? disablePadding;
  final VoidCallback? onPressed;

  const SectionHeader({
    super.key,
    required this.leftTitle,
    required this.rightTitle,
    this.onPressed,
    this.leftTitleFontSize,
    this.rightTitleFontSize,
    this.setLeftTitle,
    this.disablePadding = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: disablePadding != true ? const EdgeInsets.symmetric(horizontal: 20) : null,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              leftTitle,
              style: GoogleFonts.poppins().copyWith(
                color: Colors.white,
                fontSize: leftTitleFontSize ?? 22,
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
                    rightTitle,
                    style: GoogleFonts.poppins().copyWith(
                      color: red,
                      fontSize: rightTitleFontSize ?? 18,
                      fontWeight: FontWeight.w600,
                    ),
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
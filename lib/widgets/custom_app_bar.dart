import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:watchflix/utils/constants.dart';

class CustomAppBar extends StatelessWidget {
  final bool backButtonEnabled;
  final bool isInfoEnabled;
  final VoidCallback? onBackPressed;
  final VoidCallback? onInfoPressed;
  final String? title;
  final IconData? infoIcon;

  const CustomAppBar({
    Key? key,
    this.backButtonEnabled = false,
    this.isInfoEnabled = false,
    this.onBackPressed,
    this.onInfoPressed,
    this.title,
    this.infoIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Stack(
          children: [
            Center(
              child: Text(
                title ?? '',
                style: GoogleFonts.poppins().copyWith(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              )
            ),
            Align(
              alignment: Alignment.center,
              child: Row(
                children: [
                  if (backButtonEnabled)
                    GestureDetector(
                      onTap: () {
                        if (backButtonEnabled == true && onBackPressed != null) {
                          onBackPressed!(); // Invoke the function with ()
                        }
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: white,
                            width: 1,
                          ),
                        ),
                        child: const Center(
                          child: Icon(
                            Iconsax.arrow_left,
                            size: 20,
                            color: white,
                          ),
                        ),
                      ),
                    ),
                  if (isInfoEnabled)
                    GestureDetector(
                      onTap: () {
                        if (isInfoEnabled == true && onInfoPressed != null) {
                          onInfoPressed!(); // Invoke the function with ()
                        }
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: white,
                            width: 1,
                          ),
                        ),
                        child: Center(
                          child: Icon(
                            infoIcon ?? Iconsax.arrow_left,
                            size: 20,
                            color: white,
                          ),
                        ),
                      ),
                    )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
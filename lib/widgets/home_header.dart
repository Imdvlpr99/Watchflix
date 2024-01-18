import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:watchflix/utils/constants.dart';
import 'package:watchflix/widgets/search_bar.dart';

class HomeHeader extends StatelessWidget {
  final bool? isLoggedIn;
  final VoidCallback? loginTap;
  final TextEditingController searchController;

  const HomeHeader({
    super.key,
    required this.searchController,
    this.isLoggedIn = false,
    this.loginTap,
  });

  String getGreeting() {
    final currentTime = DateTime.now();
    final hour = currentTime.hour;

    if (hour >= 6 && hour < 12) {
      return 'Good Morning';
    } else if (hour >= 12 && hour < 18) {
      return 'Good Afternoon';
    } else {
      return 'Good Evening';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        decoration: const BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(35)
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(35)),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ClipOval(
                          child: isLoggedIn == false ?
                          SvgPicture.asset(
                            'assets/images/ava_placeholder.svg',
                            width: 70,
                            height: 70,
                          ) : Container() //not finish
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                isLoggedIn == false ? notLoggedIn : '', // not finish
                                style: GoogleFonts.poppins().copyWith(
                                    color: white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                              const SizedBox(height: 5),
                              isLoggedIn == false ? RichText(
                                  text: TextSpan(
                                      text: haveAccount,
                                      style: GoogleFonts.poppins().copyWith(
                                          color: white,
                                          fontSize: 14
                                      ),
                                      children: [
                                        TextSpan(
                                            text: ' $login',
                                            style: GoogleFonts.poppins().copyWith(
                                                color: red,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold
                                            ),
                                            recognizer: TapGestureRecognizer()..onTap = () {
                                              if (loginTap != null) {
                                                loginTap;
                                              }
                                            }
                                        )
                                      ]
                                  )
                              ) :
                              Text(
                                getGreeting(),
                                style: GoogleFonts.poppins().copyWith(
                                    color: white,
                                    fontSize: 14
                                ),
                              )
                            ],
                          )
                      ),
                      const SizedBox(width: 10),
                      Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: red
                        ),
                        child: const Icon(
                          Iconsax.setting_2,
                          color: white,
                          size: 25,
                        ),
                      )
                    ],
                  )
              ),
              const SizedBox(height: 30),
              CustomSearchBar(
                enableFilter: true,
                searchController: searchController,
                searchHint: searchHint,
              ),
              const SizedBox(height: 20)
            ],
          ),
        )
    );
  }
}
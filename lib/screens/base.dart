import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:watchflix/screens/actress.dart';
import 'package:watchflix/screens/trending.dart';
import 'package:watchflix/screens/tv_series.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:watchflix/utils/constants.dart';
import 'home.dart';

class Base extends StatefulWidget {
  const Base({super.key});

  @override
  State<StatefulWidget> createState() => _BaseState();
}

class _BaseState extends State<Base> {

  int _selectedIndex = 0;
  static final List<Widget> _navScreen = <Widget> [
    const Home(),
    const TvSeries(),
    const Trending(),
    const Actress()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: mainColor, 
        body: Center(
          child: _navScreen.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: Container(
          height: 80,
          decoration: const BoxDecoration(
            color: secondaryColor,
            borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15.0)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 0),
              child: GNav(
                backgroundColor: secondaryColor,
                color: white,
                activeColor: red,
                tabBackgroundColor: mainColor,
                gap: 8,
                padding: const EdgeInsets.all(16),
                tabs: [
                  GButton(
                    icon: _selectedIndex == 0 ? Iconsax.home_25 : Iconsax.home_2,
                    text: home,
                  ),
                  GButton(
                    icon: _selectedIndex == 1 ? Iconsax.video_circle5 : Iconsax.video_circle,
                    text: tvSeries,
                  ),
                  GButton(
                    icon: _selectedIndex == 2 ? Iconsax.star5 : Iconsax.star_1,
                    text: trending),
                  GButton(
                    icon: _selectedIndex == 3 ? Iconsax.profile_2user5 : Iconsax.profile_2user,
                    text: actress,
                  )
                ],
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                mainAxisAlignment: MainAxisAlignment.spaceAround,
              ),
            ),
          ),
        )
    );
  }

}
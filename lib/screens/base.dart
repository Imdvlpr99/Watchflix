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
                color: Colors.white,
                activeColor: Colors.white,
                tabBackgroundColor: mainColor,
                gap: 8,
                padding: const EdgeInsets.all(16),
                tabs: const [
                  GButton(
                    icon: Iconsax.home_24,
                    text: home,
                  ),
                  GButton(
                    icon: Iconsax.video_vertical,
                    text: tvSeries,
                  ),
                  GButton(
                    icon: Iconsax.star,
                    text: trending),
                  GButton(
                    icon: Iconsax.user_octagon,
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
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:watchflix/utils/constants.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<StatefulWidget> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/splash.json',
              width: 200,
              height: 200,
              fit: BoxFit.fill,
            )
          ],
        ),
      ),
    );
  }

}
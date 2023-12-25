import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../utils/constants.dart';

class ShimmerVertical extends StatelessWidget {
  const ShimmerVertical({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        bottom: 10,
      ),
      child: Shimmer.fromColors(
        baseColor: secondaryColor,
        highlightColor: Colors.grey,
        child: Container(
          height: 120,
          decoration: BoxDecoration(
            color: secondaryColor,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }

}
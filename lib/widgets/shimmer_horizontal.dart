import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../utils/constants.dart';

class ShimmerHorizontal extends StatelessWidget {
  final int index;
  const ShimmerHorizontal({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: index == 0 ? 20 : 0, right: 20),
      child: Shimmer.fromColors(
        baseColor: secondaryColor,
        highlightColor: Colors.grey,
        child: Container(
          decoration: BoxDecoration(
            color: secondaryColor,
            borderRadius: BorderRadius.circular(20),
          ),
          height: 250,
          width: 180,
        ),
      ),
    );
  }

}
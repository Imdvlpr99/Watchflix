import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../utils/constants.dart';

class ShimmerHorizontal extends StatelessWidget {
  final double? height;
  final double? width;
  const ShimmerHorizontal({
    super.key,
    this.height,
    this.width});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: secondaryColor,
      highlightColor: Colors.grey,
      child: Container(
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        height: height ?? 250,
        width: width ?? 180,
      ),
    );
  }

}
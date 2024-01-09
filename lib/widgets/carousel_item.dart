import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:watchflix/models/Movie.dart';
import 'package:watchflix/widgets/shimmer_horizontal.dart';

import '../utils/constants.dart';

class CarouselItem extends StatelessWidget {
  final Movie movieItem;
  final bool isSelected;

  const CarouselItem({
    super.key,
    required this.movieItem,
    required this.isSelected,});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: 180,
            height: 280,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: CachedNetworkImage(
                imageUrl: '$baseImageUrlW500${movieItem.posterPath}',
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
                placeholder: (context, url) => const ShimmerHorizontal(),
                errorWidget: (context, url, error) => const ShimmerHorizontal(),
              ),
            ),
          ),
        ],
      )
    );
  }

}
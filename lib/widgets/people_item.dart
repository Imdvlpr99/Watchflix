import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:watchflix/models/people.dart';

import '../utils/constants.dart';

class PeopleItem extends StatelessWidget {
  final People people;

  const PeopleItem({
    super.key,
    required this.people
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Column(
        children: [
          Container(
            width: 100,
            height: 150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15)
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: CachedNetworkImage(
                imageUrl: '$baseImageUrlOriginal${people.profilePath}',
                fit: BoxFit.cover,
                alignment: Alignment.center,
                width: double.infinity,
                height: double.infinity,
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: secondaryColor,
                  highlightColor: Colors.grey,
                  child: Container(
                    decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            people.originalName,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.poppins().copyWith(
                color: white,
                fontSize: 14,
                fontWeight: FontWeight.w600
            ),
          ),
          Text(
            people.character,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.poppins().copyWith(
                color: white,
                fontSize: 10
            ),
          )
        ],
      ),
    );
  }

}
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:watchflix/utils/constants.dart';
import 'package:watchflix/widgets/shimmer_vertical.dart';

import '../models/Movie.dart';
import '../models/genre.dart';

class MovieVerticalItem extends StatelessWidget {
  final Movie movieItem;
  final List<Genre> genreList;
  final Function? onTap;

  const MovieVerticalItem({
    super.key,
    required this.movieItem,
    required this.genreList,
    this.onTap});

  String mapGenreIdsToNames(List<int>? genreIds) {
    List<String> genreNames = genreIds!.map((id) {
      return genreList.firstWhere((genre) => genre.id == id).name;
    }).toList();

    return genreNames.join('/');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: GestureDetector(
        onTap: () {
          if (onTap != null) {
            onTap!();
          }
        },
        child: Container(
          height: 170,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: secondaryColor
          ),
          child: Row(
            children: [
              const SizedBox(width: 10),
              Container(
                height: 150,
                width: 110,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15)
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl: '$baseImageUrlW500${movieItem.posterPath}',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                    placeholder: (context, url) => const ShimmerVertical(),
                    errorWidget: (context, url, error) => const ShimmerVertical(),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget> [
                      Text(
                        movieItem.originalTitle!.toString(),
                        style: GoogleFonts.poppins().copyWith(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600
                        ),
                      )
                    ],
                  ),
                )
              ),
            ],
          ),
        ),
      ),
    );
  }

}
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:watchflix/models/Movie.dart';
import 'package:watchflix/utils/constants.dart';
import 'package:watchflix/utils/utils.dart';
import 'package:watchflix/widgets/shimmer_horizontal.dart';
import 'package:watchflix/widgets/star_rating.dart';

import '../models/genre.dart';

class MovieHorizontalItem extends StatelessWidget {
  final Movie movieItem;
  final List<Genre> genreList;
  final Function? onTap;

  const MovieHorizontalItem({
    Key? key,
    required this.movieItem,
    required this.genreList,
    this.onTap
  }) : super(key: key);

  String mapGenreIdsToNames(List<int>? genreIds) {
    List<String> genreNames = genreIds!.map((id) {
      return genreList.firstWhere((genre) => genre.id == id).name;
    }).toList();

    return genreNames.join('/');
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      width: 180,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 250,
            width: 180,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CachedNetworkImage(
                imageUrl: '$baseImageUrlW500${movieItem.posterPath}',
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
                placeholder: (context, url) => const ShimmerHorizontal(index: 0),
                errorWidget: (context, url, error) => const ShimmerHorizontal(index: 0),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movieItem.title.toString(),
                  style: GoogleFonts.poppins().copyWith(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                const SizedBox(height: 5),
                Text(
                  '${Utils.formatDateString(movieItem.releaseDate.toString(), "yyyy-MM-dd", 'yyyy')} • ${mapGenreIdsToNames(movieItem.genreIds)}',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: GoogleFonts.poppins().copyWith(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500
                  ),
                ),
                const SizedBox(height: 5),
                StarRating(
                  initialRating: movieItem.voteAverage!.toDouble(),
                  maxRating: 10,)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
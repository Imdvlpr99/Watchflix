import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:watchflix/utils/constants.dart';
import 'package:watchflix/utils/utils.dart';
import 'package:watchflix/widgets/shimmer_vertical.dart';
import 'package:watchflix/widgets/star_rating.dart';

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

  List<String> mapGenreIdsToNames(List<int>? genreIds) {
    List<String> genreNames = genreIds!.map((id) {
      return genreList.firstWhere((genre) => genre.id == id).name;
    }).toList();

    return genreNames;
  }

  @override
  Widget build(BuildContext context) {
    List<String> genreNames = mapGenreIdsToNames(movieItem.genreIds);

    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: GestureDetector(
        onTap: () {
          if (onTap != null) {
            onTap!();
          }
        },
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            minHeight: 170
          ),
          child: Container(
          height: 180,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: secondaryColor
          ),
          child: Row(
            children: [
              const SizedBox(width: 10),
              Container(
                height: 160,
                width: 120,
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
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            StarRating(
                              initialRating: movieItem.voteAverage!.toDouble(),
                              maxRating: 10,
                              color: mainColor,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              '•',
                              style: GoogleFonts.poppins().copyWith(
                                color: Colors.white,
                                fontSize: 16
                              ),
                            ),
                            const SizedBox(width: 5),
                            Container(
                              height: 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: mainColor
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10, right: 10, top: 7, bottom: 2),
                                child: Text(
                                  Utils.formatDateString(movieItem.releaseDate.toString(), 'yyyy-MM-dd', 'yyyy'),
                                  style: GoogleFonts.poppins().copyWith(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        LayoutBuilder(
                          builder: (context, constraints) {
                            double containerWidthPercentage = 0.25;
                            double containerWidth = constraints.maxWidth * containerWidthPercentage;

                            List<Widget> genreWidgets = genreNames.map((item) {
                              return Container(
                                height: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: mainColor,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10, right: 10, top: 7, bottom: 2),
                                  child: Text(
                                    item,
                                    style: GoogleFonts.poppins().copyWith(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              );
                            }).toList();

                            int maxVisibleItems = (constraints.maxWidth / containerWidth).floor();

                            if (genreWidgets.isNotEmpty && genreWidgets.length > maxVisibleItems) {
                              genreWidgets.add(
                                Container(
                                  height: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: mainColor,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10, right: 10, top: 7, bottom: 2),
                                    child: Text(
                                      'etc',
                                      style: GoogleFonts.poppins().copyWith(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }

                            return Wrap(
                              spacing: 8.0,
                              runSpacing: 8.0,
                              children: genreWidgets,
                            );
                          },
                        )
                      ],
                    ),
                  )
              ),
            ],
          ),
        ),
        ),
      ),
    );
  }

}
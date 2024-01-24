import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:watchflix/utils/constants.dart';
import 'package:watchflix/utils/utils.dart';
import 'package:watchflix/widgets/rounded_field.dart';
import 'package:watchflix/widgets/star_rating.dart';

import '../models/Movie.dart';
import '../models/genre.dart';

class MovieDesc extends StatelessWidget {
  final Movie movieItem;
  final List<Genre> genreLists;

  const MovieDesc({
    super.key,
    required this.movieItem,
    required this.genreLists
  });

  List<String?> mapGenreIdsToNames(List<int>? genreIds) {
    List<String?> genreNames = genreIds!.map((id) {
      return genreLists.firstWhere((genre) => genre.id == id).name;
    }).toList();

    return genreNames;
  }

  @override
  Widget build(BuildContext context) {
    List<String?> genreNames = mapGenreIdsToNames(movieItem.genreIds);

    return SizedBox(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Text(
                  movieItem.originalTitle != movieItem.title ?
                  movieItem.title!.toString() :
                  movieItem.originalTitle.toString(),
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins().copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 20
                  ),
                )
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RoundedField(
                  text: Utils.formatDateString(movieItem.releaseDate.toString(), 'yyyy-MM-dd', 'yyyy'),
                  textSize: 14,
                  backgroundColor: secondaryColor,
                  paddingVertical: 3,
                  paddingHorizontal: 10,
                ),
                Text(
                  ' • ',
                  style: GoogleFonts.poppins().copyWith(
                    color: Colors.grey,
                    fontSize: 20
                  ),
                ),
                StarRating(
                  initialRating: movieItem.voteAverage!.toDouble(),
                  maxRating: 10,
                  isStarInside: true,
                  textSize: 14,
                  color: secondaryColor,
                  paddingVertical: 3,
                  paddingHorizontal: 8,
                  starSize: 18,
                )
              ],
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Center(
                child: LayoutBuilder(
                  builder: (context, constraint) {
                    List<Widget> genreWidgets = genreNames.map((item) {
                      return RoundedField(
                        text: item,
                        textSize: 14,
                        backgroundColor: secondaryColor,
                        paddingVertical: 3,
                        paddingHorizontal: 10,
                      );
                    }).toList();
                    return Wrap(
                      spacing: 5.0,
                      runSpacing: 5.0,
                      alignment: WrapAlignment.center,
                      children: genreWidgets,
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

}
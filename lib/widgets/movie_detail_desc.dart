import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:watchflix/utils/constants.dart';
import 'package:watchflix/utils/utils.dart';
import 'package:watchflix/widgets/rounded_field.dart';

import '../models/genre.dart';

class MovieDetailDesc extends StatelessWidget {
  final String? releaseDate;
  final String? movieName;
  final String? releaseStatus;
  final String? originalTitle;
  final bool? isReleased;
  final List<Genre>? movieGenre;

  const MovieDetailDesc({
    super.key, 
    this.releaseDate, 
    this.movieName,
    this.isReleased,
    this.movieGenre,
    this.releaseStatus,
    this.originalTitle
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RoundedField(
                  backgroundColor: red,
                  borderRadius: 8,
                  paddingHorizontal: 7,
                  paddingVertical: 2,
                  textSize: 14,
                  text: isReleased == true ?
                  Utils.formatDateString(releaseDate!, 'yyyy-MM-dd', 'yyyy') :
                  Utils.formatDateString(releaseDate!, 'yyyy-MM-dd', 'dd MMM yyyy'),
                ),
                const SizedBox(width: 10),
                RoundedField(
                    backgroundColor: red,
                    borderRadius: 8,
                    paddingHorizontal: 7,
                    paddingVertical: 2,
                    textSize: 14,
                    text: releaseStatus
                )
              ],
            ),
            const SizedBox(height: 5),
            Text(
              movieName!,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins().copyWith(
                color: white,
                fontSize: 28,
                fontWeight: FontWeight.w600,
              ),
            ),
            movieName! != originalTitle! ?
            Text(
              originalTitle!,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins().copyWith(
                color: white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ) : const SizedBox(),
            const SizedBox(height: 15),
            Center(
              child: LayoutBuilder(
                builder: (context, constraint) {
                  List<Widget> genreWidgets = movieGenre?.map((item) {
                    return RoundedField(
                      text: item.name,
                      backgroundColor: red,
                      borderRadius: 8,
                      paddingHorizontal: 7,
                      paddingVertical: 2,
                      textSize: 14,
                    );
                  }).toList() ?? [];
                  return Wrap(
                    spacing: 5.0,
                    runSpacing: 5.0,
                    alignment: WrapAlignment.center,
                    children: genreWidgets,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

}
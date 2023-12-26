import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:watchflix/models/Movie.dart';
import 'package:watchflix/widgets/shimmer_horizontal.dart';

import '../utils/constants.dart';

class TopRatedItem extends StatelessWidget {
  final Movie movieItem;
  final Function? onTap;
  const TopRatedItem({
    super.key,
    required this.movieItem,
    this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      width: 150,
      child: GestureDetector(
        onTap: () {
          if (onTap != null) {
            onTap!();
          }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget> [
            Stack(
              children: [
                SizedBox(
                  height: 200,
                  width: 150,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: CachedNetworkImage(
                      imageUrl: '$baseImageUrlW500${movieItem.posterPath}',
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                      placeholder: (context, url) => const ShimmerHorizontal(
                        width: 150,
                        height: 200,
                      ),
                      errorWidget: (context, url, error) => const ShimmerHorizontal(
                        width: 150,
                        height: 200,
                      ),
                    ),
                  ),
                ),
                Positioned(
                    top: 5,
                    right: 5,
                    child: Container(
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: accentColor
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5, right: 7, top: 2, bottom: 2),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.star,
                              size: 15,
                              color: Colors.yellow,),
                            const SizedBox(width: 3),
                            Text(
                              '${double.parse(movieItem.voteAverage!.toDouble().toStringAsFixed(1))} / ${10.toInt()}',
                              style: GoogleFonts.poppins().copyWith(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                )
              ],
            ),
            const SizedBox(height: 5),
            Text(
                movieItem.name.toString(),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins().copyWith(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w400
                )
            )
          ],
        ),
      ),
    );
  }

}
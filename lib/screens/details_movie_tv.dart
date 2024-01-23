
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';
import 'package:watchflix/api/api_services.dart';
import 'package:watchflix/utils/constants.dart';
import 'package:watchflix/widgets/custom_app_bar.dart';
import 'package:watchflix/widgets/movie_detail_desc.dart';
import 'package:watchflix/widgets/people_item.dart';
import 'package:watchflix/widgets/section_header.dart';

import '../models/Movie.dart';
import '../models/genre.dart';
import '../models/images.dart';
import '../utils/custom_dialog.dart';
import '../utils/utils.dart';
import '../widgets/custom_page_route.dart';
import '../widgets/movie_vertical_item.dart';

class DetailsMovieTv extends StatefulWidget {
  final bool isMovie;
  final int movieId;
  final String? moviePoster;

  const DetailsMovieTv({
    super.key,
    required this.isMovie,
    required this.movieId,
    this.moviePoster
  });

  @override
  State<StatefulWidget> createState() => _DetailsMovieTvState();
}

class _DetailsMovieTvState extends State<DetailsMovieTv> {
  late final ApiServices _api;
  Movie? movieData;
  List<Images>? movieImages;
  List<Genre> movieGenreList = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    try {
      movieData = null;
      movieImages?.clear();
      movieGenreList.clear();
      _api = ApiServices();

      Movie getMovieData = await _api.getMovieDetails(widget.movieId);
      List<Images> getMovieImages = await _api.getMovieImages(widget.movieId);
      List<Genre> getMovieGenreList = await _api.getMovieGenre('en');

      setState(() {
        movieData = getMovieData;
        movieImages = getMovieImages;
        movieGenreList = getMovieGenreList;
      });

    } catch (e) {
      _showErrorDialog(e.toString());
      Utils.getLogger().e(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: movieData != null ?
      Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 500 + MediaQuery.of(context).padding.top,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 120,
                        child: Stack(
                          children: [
                            Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Column(
                                  children: [
                                    GestureDetector(
                                      child: Container(
                                        width: 70,
                                        height: 70,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                            color: red,
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.black.withOpacity(0.7),
                                                  blurRadius: 5,
                                                  offset: const Offset(0, 5)
                                              )
                                            ]
                                        ),
                                        child: const Icon(
                                          Iconsax.play_circle,
                                          size: 30,
                                          color: white,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    GestureDetector(
                                      child: Container(
                                        width: 70,
                                        height: 70,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                            color: red,
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.black.withOpacity(0.7),
                                                  blurRadius: 5,
                                                  offset: const Offset(0, 5)
                                              )
                                            ]
                                        ),
                                        child: Center(
                                          child: SvgPicture.asset(
                                            'assets/images/imdb.svg',
                                            width: 30,
                                            height: 30,
                                            colorFilter: const ColorFilter.mode(white, BlendMode.srcIn),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    GestureDetector(
                                      child: Container(
                                        width: 70,
                                        height: 70,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                            color: red,
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.black.withOpacity(0.7),
                                                  blurRadius: 5,
                                                  offset: const Offset(0, 5)
                                              )
                                            ]
                                        ),
                                        child: const Icon(
                                          Iconsax.link5,
                                          size: 30,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    GestureDetector(
                                      child: Container(
                                        width: 70,
                                        height: 70,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                            color: red,
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.black.withOpacity(0.7),
                                                  blurRadius: 5,
                                                  offset: const Offset(0, 5)
                                              )
                                            ]
                                        ),
                                        child: Center(
                                          child: SvgPicture.asset(
                                            'assets/images/instagram.svg',
                                            width: 30,
                                            height: 30,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    GestureDetector(
                                      child: Container(
                                        width: 70,
                                        height: 70,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                            color: red,
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.black.withOpacity(0.7),
                                                  blurRadius: 5,
                                                  offset: const Offset(0, 5)
                                              )
                                            ]
                                        ),
                                        child: Center(
                                          child: SvgPicture.asset(
                                            'assets/images/x.svg',
                                            width: 30,
                                            height: 30,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                            )
                          ],
                        ),
                      ),
                      Expanded(
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(25)),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black.withOpacity(0.7),
                                          blurRadius: 5,
                                          offset: const Offset(0, 5)
                                      )
                                    ]
                                ),
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(25)),
                                  child: CachedNetworkImage(
                                    imageUrl: '$baseImageUrlOriginal${movieData?.posterPath}',
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
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                  top: 0,
                                  left: 0,
                                  right: 0,
                                  child: Container(
                                    height: 120,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Colors.black.withOpacity(0.7),
                                          Colors.transparent,
                                        ],
                                      ),
                                    ),
                                  )
                              )
                            ],
                          )
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      MovieDetailDesc(
                        movieName: movieData?.title,
                        releaseDate: movieData?.releaseDate,
                        isReleased: movieData?.status == released ? true : false,
                        releaseStatus: movieData?.status,
                        movieGenre: movieData?.genres,
                        originalTitle: movieData?.originalTitle,
                        initialRating: movieData?.voteAverage,
                      ),
                      const SectionHeader(
                        leftTitle: overview,
                        rightTitle: '',
                        disablePadding: true,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        movieData?.overview ?? '',
                        style: GoogleFonts.poppins().copyWith(
                            color: white,
                            fontSize: 14
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                if (movieImages != null && movieImages?.isNotEmpty == true)
                  Column(
                    children: [
                      const SectionHeader(
                        leftTitle: gallery,
                        rightTitle: '',
                      ),
                      SizedBox(
                          height: 200,
                          child: ListView.separated(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            itemCount: movieImages?.isEmpty ?? true ? 3 : movieImages!.length,
                            scrollDirection: Axis.horizontal,
                            separatorBuilder: (BuildContext context, int index) {
                              return const SizedBox(width: 15);
                            },
                            itemBuilder: (BuildContext context, int index) {
                              if (movieImages == null || movieImages!.isEmpty) {
                                return Shimmer.fromColors(
                                  baseColor: secondaryColor,
                                  highlightColor: Colors.grey,
                                  child: Container(
                                    height: 200,
                                    width: 350,
                                    decoration: BoxDecoration(
                                      color: secondaryColor,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                );
                              } else {
                                return Container(
                                  width: 350,
                                  height: 200,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15)
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: CachedNetworkImage(
                                      imageUrl: '$baseImageUrlOriginal${movieImages?[index].filePath}',
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
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }
                            },
                          )
                      ),
                    ],
                  ),
                const SizedBox(height: 10),
                const SectionHeader(
                  leftTitle: cast,
                  rightTitle: seeAll,
                ),
                SizedBox(
                  height: 260,
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    itemCount: movieData?.cast?.isEmpty ?? true ? 3 : movieData!.cast!.length,
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(width: 15);
                    },
                    itemBuilder: (BuildContext context, int index) {
                      if (movieData == null || movieData!.cast!.isEmpty) {
                        return Shimmer.fromColors(
                          baseColor: secondaryColor,
                          highlightColor: Colors.grey,
                          child: Container(
                            height: 200,
                            width: 200,
                            decoration: BoxDecoration(
                              color: secondaryColor,
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        );
                      } else {
                        return PeopleItem(
                            people: movieData!.cast![index]
                        );
                      }
                    },
                  ),
                ),
                if (movieData?.similar?.isNotEmpty == true)
                  Column(
                    children: [
                      SectionHeader(
                        leftTitle: widget.isMovie ? relatedMovie : relatedSeries,
                        rightTitle: '',
                      ),
                      ListView.separated(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: movieData?.similar?.isEmpty ?? true ? 3 : movieData!.similar!.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(height: 15);
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return movieData!.similar!.isEmpty ?
                          Shimmer.fromColors(
                            baseColor: secondaryColor,
                            highlightColor: Colors.grey,
                            child: Container(
                              height: 200,
                              width: 150,
                              decoration: BoxDecoration(
                                color: secondaryColor,
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ) :
                          MovieVerticalItem(
                            movieItem: movieData!.similar![index],
                            genreList: movieGenreList,
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  CustomPageRoute(
                                    child: DetailsMovieTv(
                                      isMovie: true,
                                      movieId: movieData!.similar![index].id!,
                                      moviePoster: movieData!.similar![index].posterPath,
                                    ),
                                    direction: AxisDirection.left, // Specify the desired transition direction
                                  )
                              );
                            },
                          );
                        },
                      )
                    ],
                  )
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: CustomAppBar(
              backButtonEnabled: true,
              onBackPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ) :
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/anim/loading.json',
              width: 200,
              height: 200,
            )
          ],
        ),
      ),
    );
  }

  void _showErrorDialog(String error) {
    CustomDialog.showErrorDialog(
      context: context,
      title: error,
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
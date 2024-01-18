import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';
import 'package:watchflix/api/api_services.dart';
import 'package:watchflix/utils/constants.dart';
import 'package:watchflix/widgets/custom_app_bar.dart';
import 'package:watchflix/widgets/movie_detail_desc.dart';

import '../models/Movie.dart';
import '../utils/custom_dialog.dart';
import '../utils/utils.dart';

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

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    try {
      movieData = null;
      _api = ApiServices();

      Movie getMovieData = await _api.getMovieDetails(widget.movieId);
      setState(() {
        movieData = getMovieData;
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
                                        child: Center(
                                          child: SvgPicture.asset(
                                            'assets/images/youtube.svg',
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
                                            'assets/images/imdb.svg',
                                            width: 30,
                                            height: 30,
                                            color: Colors.white,
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
                                          Iconsax.link_26,
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
                    children: [
                      const SizedBox(height: 10),
                      MovieDetailDesc(
                        movieName: movieData?.title,
                        releaseDate: movieData?.releaseDate,
                        isReleased: movieData?.status == released ? true : false,
                        releaseStatus: movieData?.status,
                        movieGenre: movieData?.genres,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          // CustomAppBar
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
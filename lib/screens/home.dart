import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:watchflix/api/api_services.dart';
import 'package:watchflix/utils/constants.dart';
import 'package:watchflix/utils/custom_dialog.dart';
import 'package:watchflix/widgets/carousel_item.dart';
import 'package:watchflix/widgets/home_header.dart';
import 'package:watchflix/widgets/movie_desc.dart';
import 'package:watchflix/widgets/section_header.dart';
import 'package:watchflix/utils/utils.dart';
import 'package:watchflix/widgets/shimmer_horizontal.dart';
import 'package:watchflix/widgets/shimmer_vertical.dart';

import '../models/Movie.dart';
import '../models/genre.dart';
import '../widgets/movie_vertical_item.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _searchController = TextEditingController();
  List<Movie>? nowPlayingList = [];
  List<Movie>? popularList = [];
  List<Genre> movieGenreList = [];

  int _currentPage  = 0;
  Movie? selectedMovie;
  bool? isSearchEmpty;

  @override
  void initState() {
    super.initState();
    fetchData(context);
    isSearchEmpty = true;
    _searchController.addListener(() {
      setState(() {
        if (_searchController.text.isEmpty) {
          isSearchEmpty = true;
          Utils.getLogger().d('isSearchEmpty : $isSearchEmpty');
        } else {
          isSearchEmpty = false;
          Utils.getLogger().d('isSearchEmpty : $isSearchEmpty');
        }
      });
    });
  }

  void fetchData(BuildContext context) async {
    try {
      nowPlayingList?.clear();
      popularList?.clear();
      movieGenreList.clear();

      List<Movie> getNowPlaying = await ApiServices.getNowPlayingMovie('en-US', 'id', 1);
      List<Movie> getPopular = await ApiServices.getPopularMovie('en-US', 'id', 1);
      List<Genre> getMovieGenreList = await ApiServices.getMovieGenre('en');

      setState(() {
        nowPlayingList = getNowPlaying;
        movieGenreList = getMovieGenreList;
        popularList = getPopular;
        selectedMovie = nowPlayingList![0];
      });
    } catch (e) {
      _showErrorDialog(e.toString());
      Utils.getLogger().e(e);
    }
  }

  void _showErrorDialog(String error) {
    CustomDialog.showErrorDialog(
      context: context,
      title: error,
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: HomeHeader(
              searchController: _searchController,
            ),
          ),
          isSearchEmpty == true ?
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: secondaryColor,
              ),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(35)),
                  color: mainColor,
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(topRight: Radius.circular(35)),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        const SectionHeader(
                          leftTitle: nowPlaying,
                          rightTitle: seeAll,
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          child: Column(
                            children: [
                              CarouselSlider.builder(
                                itemCount: nowPlayingList?.isEmpty ?? true ? 3 : nowPlayingList!.length,
                                options: CarouselOptions(
                                  height: 290,
                                  viewportFraction: 0.45,
                                  enableInfiniteScroll: true,
                                  scrollDirection: Axis.horizontal,
                                  onPageChanged: (index, reason) {
                                    setState(() {
                                      _currentPage = index;
                                      selectedMovie = nowPlayingList![index];
                                    });
                                  },
                                ),
                                itemBuilder: (context, index, pageViewIndex) {
                                  final bool isSelected = _currentPage == index;
                                  final double scaleFactor = isSelected ? 1.0 : 0.9;

                                  return Transform.scale(
                                    scale: scaleFactor,
                                    child: nowPlayingList!.isEmpty
                                        ? const ShimmerHorizontal()
                                        : CarouselItem(
                                      movieItem: nowPlayingList![index],
                                      isSelected: isSelected,
                                    ),
                                  );
                                },
                              ),
                              const SizedBox(height: 5),
                              if (selectedMovie != null)
                                MovieDesc(
                                  movieItem: selectedMovie!,
                                  genreLists: movieGenreList,
                                ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        const SectionHeader(
                          leftTitle: popular,
                          rightTitle: seeAll,
                          rightTitleFontSize: 16,
                          leftTitleFontSize: 20,
                        ),
                        MediaQuery.removePadding(
                          context: context,
                          removeTop: true,
                          child: ListView.separated(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: popularList?.isEmpty ?? true ? 3 : popularList!.length,
                            separatorBuilder: (BuildContext context, int index) {
                              return const SizedBox(height: 15);
                            },
                            itemBuilder: (BuildContext context, int index) {
                              return popularList!.isEmpty
                                  ? const ShimmerVertical()
                                  : MovieVerticalItem(
                                movieItem: popularList![index],
                                genreList: movieGenreList,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ) :
          Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: secondaryColor
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(35)),
                    color: mainColor,
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(topRight: Radius.circular(35)),
                    child: Container(),
                  ),
                ),
              )
          ),
        ],
      ),
    );
  }
}
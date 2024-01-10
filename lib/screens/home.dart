import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:watchflix/api/api_services.dart';
import 'package:watchflix/utils/constants.dart';
import 'package:watchflix/utils/custom_dialog.dart';
import 'package:watchflix/widgets/carousel_item.dart';
import 'package:watchflix/widgets/movie_desc.dart';
import 'package:watchflix/widgets/search_bar.dart';
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

  late int _currentPage  = 0;
  Movie? selectedMovie;

  @override
  void initState() {
    super.initState();
    fetchData(context);
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget> [
            const SizedBox(height: 10),
            Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              child: CustomSearchBar(
                enableFilter: true,
                searchController: _searchController,
                searchHint: searchHint,
              )
            ),
            const SizedBox(height: 10),
            const SectionHeader(
                headerTitle: nowPlaying,
                seeAllTitle: 'See All'),
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
                  const SizedBox(height: 10),
                  if (selectedMovie != null)
                    MovieDesc(
                      movieItem: selectedMovie!,
                      genreLists: movieGenreList,),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  popular,
                  style: GoogleFonts.poppins().copyWith(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600
                  ),
                ),
              ),
            ),
            MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: popularList?.isEmpty ?? true ? 3 : popularList!.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(height: 15);
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return popularList!.isEmpty ? const ShimmerVertical() :
                    MovieVerticalItem(
                      movieItem: popularList![index],
                      genreList: movieGenreList,
                    );
                  },
                )
            )
          ],
        ),
      ),
    );
  }

}
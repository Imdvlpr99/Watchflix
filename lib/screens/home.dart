import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:watchflix/api/api_services.dart';
import 'package:watchflix/utils/constants.dart';
import 'package:watchflix/utils/custom_dialog.dart';
import 'package:watchflix/utils/utils.dart';
import 'package:watchflix/widgets/custom_text_field.dart';
import 'package:watchflix/widgets/movie_horizontal_item.dart';
import 'package:watchflix/widgets/shimmer_horizontal.dart';
import 'package:watchflix/widgets/shimmer_vertical.dart';

import '../models/Movie.dart';
import '../models/genre.dart';
import '../widgets/movie_vertical_item.dart';
import '../widgets/top_rated_item.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _searchController = TextEditingController();
  List<Movie>? nowPlayingList = [];
  List<Movie>? popularList = [];
  List<Movie>? topRatedList = [];
  List<Genre> movieGenreList = [];

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
      List<Movie> getTopRatedMovie = await ApiServices.getTopRatedMovie('en-US', 'ID', 1);
      List<Movie> getPopular = await ApiServices.getPopularMovie('en-US', 'id', 1);
      List<Genre> getMovieGenreList = await ApiServices.getMovieGenre('en');

      setState(() {
        nowPlayingList = getNowPlaying;
        movieGenreList = getMovieGenreList;
        topRatedList = getTopRatedMovie;
        popularList = getPopular;
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
            Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SizedBox(
                height: 100,
                child: Center(
                  child: CustomTextField<String>(
                    controller: _searchController,
                    labelText: '',
                    hintText: searchMovieHint,
                    suffixIcon: const Icon(
                      Iconsax.search_normal,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  nowPlaying,
                  style: GoogleFonts.poppins().copyWith(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: nowPlayingList?.isEmpty ?? true ? 250 : 350,
              child: MediaQuery.removePadding(
                  context: context,
                  removeLeft: true,
                  removeRight: true,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount: nowPlayingList?.isEmpty ?? true ? 3 : nowPlayingList!.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(width: 15);
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return nowPlayingList!.isEmpty ? const ShimmerHorizontal() :
                      MovieHorizontalItem(
                        movieItem: nowPlayingList![index],
                        genreList: movieGenreList,
                      );
                    },
                  )),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  topRated,
                  style: GoogleFonts.poppins().copyWith(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: topRatedList?.isEmpty ?? true ? 200 : 260,
              child: MediaQuery.removePadding(
                  context: context,
                  removeLeft: true,
                  removeRight: true,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount: topRatedList?.isEmpty ?? true ? 3 : topRatedList!.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(width: 15);
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return topRatedList!.isEmpty ? const ShimmerHorizontal() :
                      TopRatedItem(
                        movieItem: topRatedList![index],
                      );
                    },
                  )),
            ),
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
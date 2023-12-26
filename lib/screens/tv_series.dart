import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:watchflix/utils/constants.dart';
import 'package:watchflix/widgets/top_rated_item.dart';

import '../api/api_services.dart';
import '../models/Movie.dart';
import '../models/genre.dart';
import '../utils/custom_dialog.dart';
import '../utils/utils.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/movie_horizontal_item.dart';
import '../widgets/shimmer_horizontal.dart';

class TvSeries extends StatefulWidget {
  const TvSeries({super.key});

  @override
  State<StatefulWidget> createState() => _TvSeriesState();
}

class _TvSeriesState extends State<TvSeries> {
  final _searchController = TextEditingController();
  List<Movie>? onTheAirList = [];
  List<Movie>? topRatedList = [];
  List<Genre> tvGenreList = [];

  @override
  void initState() {
    super.initState();
    fetchData(context);
  }

  void fetchData(BuildContext context) async {
    try {
      onTheAirList?.clear();
      topRatedList?.clear();
      tvGenreList.clear();

      List<Movie> getOnTheAir = await ApiServices.getOnTheAir('en-US', 'id', 1);
      List<Movie> getTopRated = await ApiServices.getTopRatedTv('en-US', 1);
      List<Genre> tvGenre = await ApiServices.getTvGenre('en');

      setState(() {
        onTheAirList = getOnTheAir;
        topRatedList = getTopRated;
        tvGenreList = tvGenre;
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
                    hintText: searchTvSeriesHint,
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
                  onTheAir,
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
              height: onTheAirList?.isEmpty ?? true ? 250 : 350,
              child: MediaQuery.removePadding(
                  context: context,
                  removeLeft: true,
                  removeRight: true,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount: onTheAirList?.isEmpty ?? true ? 3 : onTheAirList!.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(width: 15);
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return onTheAirList!.isEmpty ? const ShimmerHorizontal() :
                      MovieHorizontalItem(
                        movieItem: onTheAirList![index],
                        genreList: tvGenreList,
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
              height: topRatedList?.isEmpty ?? true ? 200 : 280,
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
          ],
        ),
      ),
    );
  }

}
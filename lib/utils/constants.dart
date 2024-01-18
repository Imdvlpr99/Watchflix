import 'package:flutter/material.dart';

const Color mainColor = Color(0xFF404258);
const Color secondaryColor = Color(0xFF474E68);
const Color accentColor = Color(0xFF79587B);
const Color red = Color(0xFFEB2121);
const Color white = Color(0xFFF7F8FF);
const Color gold = Color(0xFFD4A418);

/// BASE URL
const String baseUrl = 'https://api.themoviedb.org/3';
const String baseImageUrlW500 = 'https://image.tmdb.org/t/p/w500';
const String baseImageUrlOriginal = 'https://image.tmdb.org/t/p/original';
const String accessToken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlM2YwOGFmOGMzMGU4OGVlNjcwOTE4NzZiZTYwMGRjZiIsInN1YiI6IjY1N2U4ODRlZWE4NGM3MTYzZWI3ZjBhOSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.IeLlIspFS7Vfjqb70sabIZVZjLmPXfPf8T0eWdUd0vY';

/// TRANSLATION
const String home = 'Home';
const String tvSeries = 'TV Series';
const String trending = 'Trending';
const String actress = 'Actress';
const String search = 'Search';
const String searchMovieHint = 'Search movie';
const String searchTvSeriesHint = 'Search TV Series';
const String nowPlaying = 'Now Playing';
const String popular = 'Popular';
const String buttonOk = 'Ok';
const String onTheAir = 'On The Air';
const String topRated = 'Top Rated';
const String searchHint = 'Search Movie, TV Series or Actress';
const String notLoggedIn = 'You\'re not logged in';
const String haveAccount = 'Do you have account?';
const String login = 'Login';
const String seeAll = 'See All';
const String httpError = 'Error retrieving data from API';
const String released = 'Released';

/// ENDPOINTS
const String getNowPlayingList = '/movie/now_playing?';
const String getPopularMovieList = '/movie/popular?';
const String getMovieGenreList = '/genre/movie/list?';
const String getTvGenreList = '/genre/tv/list?';
const String getOnTheAirList = '/tv/on_the_air?';
const String getTopRatedTvList = '/tv/top_rated?';
const String getTopRatedMovieList = '/movie/top_rated?';
const String movieDetail = '/movie/';

/// PARAMS
const String language = 'language=';
const String page = 'page=';
const String region = 'region=';
const String timezone = 'timezone=';
const String appendToResponse = '&append_to_response=videos,images,similar,credits,external_ids';

/**
 * GENRES
 */


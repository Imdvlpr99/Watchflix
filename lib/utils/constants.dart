import 'package:flutter/material.dart';

const Color mainColor = Color(0xFF404258);
const Color secondaryColor = Color(0xFF474E68);
const Color accentColor = Color(0xFF79587b);

/**
 * BASE URL
 */
const String baseUrl = 'https://api.themoviedb.org/3';
const String baseImageUrlW500 = 'https://image.tmdb.org/t/p/w500';
const String accessToken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlM2YwOGFmOGMzMGU4OGVlNjcwOTE4NzZiZTYwMGRjZiIsInN1YiI6IjY1N2U4ODRlZWE4NGM3MTYzZWI3ZjBhOSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.IeLlIspFS7Vfjqb70sabIZVZjLmPXfPf8T0eWdUd0vY';

/**
 * TRANSLATION
 */
const String home = 'Home';
const String tvSeries = 'TV Series';
const String trending = 'Trending';
const String actress = 'Actress';
const String search = 'Search';
const String searchMovieHint = 'Search movie';
const String nowPlaying = 'Now Playing';
const String popular = 'Popular';
const String buttonOk = 'Ok';
const String httpError = 'Error retrieving data from API';

/**
 * ENDPOINTS
 */
const String getNowPlayingList = '/movie/now_playing?';
const String getPopularMovieList = '/movie/popular?';
const String getMovieGenreList = '/genre/movie/list?';
const String getTvGenreList = '/genre/tv/list?';

/**
 * PARAMS
 */
const String language = 'language=';
const String page = 'page=';
const String region = 'region=';

/**
 * GENRES
 */


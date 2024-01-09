import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:watchflix/models/Movie.dart';
import 'package:watchflix/models/genre.dart';
import 'package:watchflix/utils/constants.dart';
import 'package:watchflix/utils/utils.dart';

class ApiServices {
  static Future<List<Movie>> getNowPlayingMovie(String lang, String regionName, int pageCount) async {
    try {
      final Uri uri = Uri.parse('$baseUrl$getNowPlayingList$language$lang&$page$pageCount&$region$regionName');
      final response = await http.get(
          uri,
          headers: <String, String> {
            'Authorization': 'Bearer $accessToken',
            'Content-Type': 'application/json',
          });

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as Map<String, dynamic>;
        final List<dynamic> results = json['results'] as List<dynamic>;

        List<Movie> movies = results.map((item) => Movie.fromJson(item)).toList();
        return movies;
      } else {
        final json = jsonDecode(response.body) as Map<String, dynamic>;
        String errorMessage = json['status_message'] as String;
        return Future.error(errorMessage);
      }
    } catch (e) {
      Utils.getLogger().e('Error : $e');
      rethrow;
    }
  }

  static Future<List<Genre>> getMovieGenre(String lang) async {
    try {
      final Uri uri = Uri.parse('$baseUrl$getMovieGenreList$language$lang');
      final response = await http.get(
          uri,
          headers: <String, String> {
            'Authorization': 'Bearer $accessToken',
            'Content-Type': 'application/json',
          });

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as Map<String, dynamic>;
        final List<dynamic> results = json['genres'] as List<dynamic>;

        List<Genre> genres = results.map((item) => Genre.fromJson(item)).toList();
        return genres;
      } else {
        final json = jsonDecode(response.body) as Map<String, dynamic>;
        String errorMessage = json['status_message'] as String;
        return Future.error(errorMessage);
      }
    } catch (e) {
      Utils.getLogger().e('Error : $e');
      rethrow;
    }
  }

  static Future<List<Genre>> getTvGenre(String lang) async {
    try {
      final Uri uri = Uri.parse('$baseUrl$getTvGenreList$language$lang');
      final response = await http.get(
          uri,
          headers: <String, String> {
            'Authorization': 'Bearer $accessToken',
            'Content-Type': 'application/json',
          });

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as Map<String, dynamic>;
        final List<dynamic> results = json['genres'] as List<dynamic>;

        List<Genre> genres = results.map((item) => Genre.fromJson(item)).toList();
        return genres;
      } else {
        final json = jsonDecode(response.body) as Map<String, dynamic>;
        String errorMessage = json['status_message'] as String;
        return Future.error(errorMessage);
      }
    } catch (e) {
      Utils.getLogger().e('Error : $e');
      rethrow;
    }
  }

  static Future<List<Movie>> getPopularMovie(String lang, String regionName, int pageCount) async {
    try {
      final Uri uri = Uri.parse('$baseUrl$getPopularMovieList$language$lang&$page$pageCount&$region$regionName');
      final response = await http.get(
          uri,
          headers: <String, String> {
            'Authorization': 'Bearer $accessToken',
            'Content-Type': 'application/json',
          });

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as Map<String, dynamic>;
        final List<dynamic> results = json['results'] as List<dynamic>;

        List<Movie> movies = results.map((item) => Movie.fromJson(item)).toList();
        return movies;
      } else {
        final json = jsonDecode(response.body) as Map<String, dynamic>;
        String errorMessage = json['status_message'] as String;
        return Future.error(errorMessage);
      }
    } catch (e) {
      Utils.getLogger().e('Error : $e');
      rethrow;
    }
  }

  static Future<List<Movie>> getOnTheAir(String lang, String tz, int pageCount) async {
    try {
      final Uri uri = Uri.parse('$baseUrl$getOnTheAirList$language$lang&$page$pageCount&$timezone$tz');
      final response = await http.get(
          uri,
          headers: <String, String> {
            'Authorization': 'Bearer $accessToken',
            'Content-Type': 'application/json',
          });

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as Map<String, dynamic>;
        final List<dynamic> results = json['results'] as List<dynamic>;

        List<Movie> movies = results.map((item) => Movie.fromJson(item)).toList();
        return movies;
      } else {
        final json = jsonDecode(response.body) as Map<String, dynamic>;
        String errorMessage = json['status_message'] as String;
        return Future.error(errorMessage);
      }
    } catch (e) {
      Utils.getLogger().e('Error : $e');
      rethrow;
    }
  }

  static Future<List<Movie>> getTopRatedTv(String lang, int pageCount) async {
    try {
      final Uri uri = Uri.parse('$baseUrl$getTopRatedTvList$language$lang&$page$pageCount');
      final response = await http.get(
          uri,
          headers: <String, String> {
            'Authorization': 'Bearer $accessToken',
            'Content-Type': 'application/json',
          });

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as Map<String, dynamic>;
        final List<dynamic> results = json['results'] as List<dynamic>;

        List<Movie> movies = results.map((item) => Movie.fromJson(item)).toList();
        return movies;
      } else {
        final json = jsonDecode(response.body) as Map<String, dynamic>;
        String errorMessage = json['status_message'] as String;
        return Future.error(errorMessage);
      }
    } catch (e) {
      Utils.getLogger().e('Error : $e');
      rethrow;
    }
  }

  static Future<List<Movie>> getTopRatedMovie(String lang, String regionName, int pageCount) async {
    try {
      final Uri uri = Uri.parse('$baseUrl$getTopRatedMovieList$language$lang&$page$pageCount&$region$regionName');
      final response = await http.get(
          uri,
          headers: <String, String> {
            'Authorization': 'Bearer $accessToken',
            'Content-Type': 'application/json',
          });

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as Map<String, dynamic>;
        final List<dynamic> results = json['results'] as List<dynamic>;

        List<Movie> movies = results.map((item) => Movie.fromJson(item)).toList();
        return movies;
      } else {
        final json = jsonDecode(response.body) as Map<String, dynamic>;
        String errorMessage = json['status_message'] as String;
        return Future.error(errorMessage);
      }
    } catch (e) {
      Utils.getLogger().e('Error : $e');
      rethrow;
    }
  }
}
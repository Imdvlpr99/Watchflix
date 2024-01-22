import 'package:watchflix/models/external_id.dart';
import 'package:watchflix/models/spoken_languages.dart';
import 'package:watchflix/models/videos.dart';

import 'people.dart';
import 'genre.dart';

class Movie {
  late final bool? adult;
  late final bool? video;
  late final int? id;
  late final int? voteCount;
  late final int? runtime;
  late final List<int>? genreIds;
  late final List<SpokenLanguage>? spokenLanguage;
  late final String? name;
  late final String? originalLanguage;
  late final String? originalName;
  late final String? overview;
  late final String? posterPath;
  late final String? mediaType;
  late final String? releaseDate;
  late final String? originalTitle;
  late final String? title;
  late final String? firstAirDate;
  late final String? backdropPath;
  late final String? homepage;
  late final String? status;
  late final double? popularity;
  late final double? voteAverage;
  late final List<Genre>? genres;
  late final List<Videos>? videos;
  late final List<Movie>? similar;
  late final List<People>? cast;
  late final ExternalIDs? externalIds;

  Movie({
    this.adult,
    this.backdropPath,
    this.id,
    this.name,
    this.originalLanguage,
    this.originalName,
    this.overview,
    this.posterPath,
    this.mediaType,
    this.genreIds,
    this.popularity,
    this.releaseDate,
    this.video,
    this.voteAverage,
    this.voteCount,
    this.originalTitle,
    this.title,
    this.firstAirDate,
    this.genres,
    this.videos,
    this.spokenLanguage,
    this.homepage,
    this.status,
    this.runtime,
    this.similar,
    this.cast,
    this.externalIds
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      adult: json['adult'] ?? false,
      backdropPath: json['backdrop_path'] ?? '',
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      originalLanguage: json['original_language'] ?? '',
      originalName: json['original_name'] ?? '',
      overview: json['overview'] ?? '',
      posterPath: json['poster_path'] ?? '',
      mediaType: json['media_type'] ?? '',
      genreIds: List<int>.from(json['genre_ids'] ?? []),
      popularity: json['popularity'] ?? 0.0,
      releaseDate: json['release_date'] ?? '',
      video: json['video'] ?? false,
      voteAverage: json['vote_average'] ?? 0.0,
      voteCount: json['vote_count'] ?? 0,
      originalTitle: json['original_title'] ?? '',
      title: json['title'] ?? '',
      firstAirDate: json['first_air_date'] ?? '',
      genres: List<Genre>.from(
        (json['genres'] as List<dynamic>?)
            ?.map((genreJson) => Genre.fromJson(genreJson)).toList() ?? [],
      ),
      videos: json.containsKey('videos') == true ? List<Videos>.from(
          (json['videos']['results'] as List<dynamic>?)
              ?.map((videoList) => Videos.fromJson(videoList)).toList() ?? []
      ) : [],
      spokenLanguage: List<SpokenLanguage>.from(
        (json['spoken_languages'] as List<dynamic>?)
            ?.map((spokenLanguageJson) =>
            SpokenLanguage.fromJson(spokenLanguageJson)).toList() ?? [],
      ),
      homepage: json['homepage'] ?? '',
      status: json['status'] ?? '',
      runtime: json['runtime'] ?? 0,
      similar: json.containsKey('similar') == true ? List<Movie>.from(
          (json['similar']['results'] as List<dynamic>?)
              ?.map((similarMovies) => Movie.fromJson(similarMovies)).toList() ?? []
      ) : [],
      cast: json.containsKey('credits') == true ? List<People>.from(
          (json['credits']['cast'] as List<dynamic>?)
              ?.map((castList) => People.fromJson(castList)).toList() ?? []
      ) : [],
      externalIds: json.containsKey('external_ids') ? ExternalIDs.fromJson(json['external_ids']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'adult': adult,
      'backdrop_path': backdropPath,
      'id': id,
      'name': name,
      'original_language': originalLanguage,
      'original_name': originalName,
      'overview': overview,
      'poster_path': posterPath,
      'media_type': mediaType,
      'genre_ids': genreIds,
      'popularity': popularity,
      'release_date': releaseDate,
      'video': video,
      'vote_average': voteAverage,
      'vote_count': voteCount,
      'original_title': originalTitle,
      'title': title,
      'first_air_date': firstAirDate,
      'genres': genres?.map((genre) => genre.toJson()).toList(),
      'videos': videos?.map((video) => video.toJson()).toList(),
      'spoken_languages': spokenLanguage?.map((language) => language.toJson()).toList(),
      'homepage': homepage,
      'status': status,
      'runtime': runtime,
      'similar': similar?.map((similarMovie) => similarMovie.toJson()).toList(),
      'cast': cast?.map((castList) => castList.toJson()).toList(),
      'external_ids': externalIds?.toJson()
    };
  }
}
class Movie {
  late final bool? adult;
  late final String? backdropPath;
  late final int? id;
  late final String? name;
  late final String? originalLanguage;
  late final String? originalName;
  late final String? overview;
  late final String? posterPath;
  late final String? mediaType;
  late final List<int>? genreIds;
  late final double? popularity;
  late final String? releaseDate;
  late final bool? video;
  late final double? voteAverage;
  late final int? voteCount;
  late final String? originalTitle;
  late final String? title;

  Movie(
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
      );

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      json['adult'] ?? false,
      json['backdrop_path'] ?? '',
      json['id'] ?? 0,
      json['name'] ?? '',
      json['original_language'] ?? '',
      json['original_name'] ?? '',
      json['overview'] ?? '',
      json['poster_path'] ?? '',
      json['media_type'] ?? '',
      List<int>.from(json['genre_ids'] ?? []),
      json['popularity'] ?? 0.0,
      json['release_date'] ?? '',
      json['video'] ?? false,
      json['vote_average'] ?? 0.0,
      json['vote_count'] ?? 0,
      json['original_title'] ?? '',
      json['title'] ?? ''
    );
  }
}
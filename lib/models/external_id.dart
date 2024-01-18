class ExternalIDs {

  late final String imdbId;
  late final String wikidataId;
  late final String instagramId;
  late final String twitterId;

  ExternalIDs(
      this.imdbId,
      this.wikidataId,
      this.instagramId,
      this.twitterId
      );

  factory ExternalIDs.fromJson(Map<String, dynamic> json) {
    return ExternalIDs(
        json['imdb_id'] ?? '',
        json['wikidata_id'] ?? '',
        json['instagram_id'] ?? '',
        json['twitter_id'] ?? ''
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'imdb_id': imdbId,
      'wikidata_id': wikidataId,
      'instagram_id': instagramId,
      'twitter_id': twitterId
    };
  }
}
class SpokenLanguage {
  late final String englishName;
  late final String isoId;
  late final String name;

  SpokenLanguage(
      this.englishName,
      this.isoId,
      this.name
      );

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) {
    return SpokenLanguage(
        json['english_name'] ?? '',
        json['iso_639_1'] ?? '',
        json['name'] ?? ''
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'english_name': englishName,
      'iso_639_1': isoId,
      'name': name,
    };
  }
}
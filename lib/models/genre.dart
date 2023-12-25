class Genre {
  late final int id;
  late final String name;

  Genre(
      this.id,
      this.name);

  factory Genre.fromJson(Map<String, dynamic> json) {
    return Genre(
        json['id'] ?? 0,
        json['name'] ?? '');
  }
}
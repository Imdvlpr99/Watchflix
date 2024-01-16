class Genre {
  late final int? id;
  late final String? name;

  Genre({
    this.id,
    this.name
  });

  factory Genre.fromJson(Map<String, dynamic> json) {
    return Genre(
        id: json['id'] ?? 0,
        name: json['name'] ?? ''
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name
    };
  }
}
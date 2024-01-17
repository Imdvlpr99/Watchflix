class Videos {
  late final String name;
  late final String key;
  late final String site;
  late final String type;
  late final bool official;

  Videos(
      this.name,
      this.key,
      this.site,
      this.type,
      this.official
      );

  factory Videos.fromJson(Map<String, dynamic> json) {
    return Videos(
        json['name'] ?? '',
        json['key'] ?? '',
        json['site'] ?? '',
        json['type'] ?? '',
        json['official'] ?? false
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'key': key,
      'site': site,
      'type': type,
      'official': official
    };
  }
}
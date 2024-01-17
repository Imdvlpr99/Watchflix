class Cast {

  late final bool adult;
  late final int gender;
  late final int id;
  late final String knowForDepartment;
  late final String name;
  late final String originalName;
  late final String profilePath;
  late final String character;

  Cast(
      this.adult,
      this.gender,
      this.id,
      this.knowForDepartment,
      this.name,
      this.originalName,
      this.profilePath,
      this.character
      );

  factory Cast.fromJson(Map<String, dynamic> json) {
    return Cast(
      json['adult'] ?? false,
      json['gender'] ?? 0,
      json['id'] ?? 0,
      json['known_for_department'] ?? '',
      json['name'] ?? '',
      json['original_name'] ?? '',
      json['profile_path'] ?? '',
      json['character'] ?? ''
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'adult': adult,
      'gender': gender,
      'id': id,
      'known_for_department': knowForDepartment,
      'name': name,
      'original_name': originalName,
      'profile_path': profilePath,
      'character': character
    };
  }

}
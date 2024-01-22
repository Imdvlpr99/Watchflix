class Images {
  late final String filePath;

  Images(
      this.filePath
      );

  factory Images.fromJson(Map<String, dynamic> json) {
    return Images(
        json['file_path'] ?? ''
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'file_path': filePath
    };
  }
}
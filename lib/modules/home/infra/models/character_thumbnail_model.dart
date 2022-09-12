class CharacterThumbnailModel {
  final String? path;
  final String? extensionThumbnail;
  CharacterThumbnailModel({
    this.path,
    this.extensionThumbnail,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'path': path,
      'extension': extensionThumbnail,
    };
  }

  factory CharacterThumbnailModel.fromMap(Map<String, dynamic> map) {
    return CharacterThumbnailModel(
      path: map['path'],
      extensionThumbnail: map['extension'],
    );
  }
}

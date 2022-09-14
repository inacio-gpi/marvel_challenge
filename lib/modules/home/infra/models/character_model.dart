// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../../../../core/constants/strings.dart';
import '../../domain/entities/character_entity.dart';
import 'character_thumbnail_model.dart';

class CharacterModel {
  final int? id;
  final String? name;
  final String? description;
  final CharacterThumbnailModel? thumbnail;

  CharacterModel({
    this.id,
    this.name,
    this.description,
    this.thumbnail,
  });

  CharacterEntity toEntity() => CharacterEntity(
        id: id ?? 0,
        name: name ?? 'Undefined',
        description: description ?? "No comments",
        imageUrl: ((thumbnail?.path != null) &&
                (thumbnail?.extensionThumbnail != null))
            ? '${thumbnail!.path!}.${thumbnail!.extensionThumbnail!}'
            : NO_IMAGE,
      );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'thumbnail': thumbnail?.toMap(),
    };
  }

  factory CharacterModel.fromMap(Map<String, dynamic> map) {
    return CharacterModel(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      thumbnail: CharacterThumbnailModel.fromMap(map['thumbnail']),
    );
  }

  String toJson() => json.encode(toMap());

  factory CharacterModel.fromJson(String source) =>
      CharacterModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

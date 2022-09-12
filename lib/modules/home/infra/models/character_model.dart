// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../../domain/entities/character_entity.dart';

class CharacterModel {
  final int? id;
  final String? name;
  final String? description;

  CharacterModel({
    this.id,
    this.name,
    this.description,
  });

  CharacterEntity toEntity() => CharacterEntity(
        id: id ?? 0,
        name: name ?? 'Undefined',
        description: description ?? "No comments",
      );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
    };
  }

  factory CharacterModel.fromMap(Map<String, dynamic> map) {
    return CharacterModel(
      id: map['id'],
      name: map['name'],
      description: map['description'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CharacterModel.fromJson(String source) =>
      CharacterModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

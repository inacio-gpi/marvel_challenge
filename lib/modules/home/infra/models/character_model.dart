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
}

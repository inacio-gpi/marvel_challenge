import '../../domain/entities/character_filter_entity.dart';

class CharacterFilterModel {
  final int? limit;
  final int? offset;
  final String? nameStartsWith;

  CharacterFilterModel({
    this.limit,
    this.offset,
    this.nameStartsWith,
  });
  Map<String, dynamic> toMap() => {
        'limit': limit,
        'offset': offset,
        'nameStartsWith': nameStartsWith,
      };

  factory CharacterFilterModel.fromEntity({CharacterFilterEntity? entity}) =>
      CharacterFilterModel(
        limit: entity?.limit,
        offset: entity?.offset,
        nameStartsWith: entity?.nameStartsWith,
      );
}

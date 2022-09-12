class CharacterFilterEntity {
  final int? limit;
  final int? offset;
  final String? nameStartsWith;

  CharacterFilterEntity({
    this.limit,
    this.offset,
    this.nameStartsWith,
  });

  CharacterFilterEntity copyWith({
    int? limit,
    int? offset,
    String? nameStartsWith,
  }) {
    return CharacterFilterEntity(
      limit: limit ?? this.limit,
      offset: offset ?? this.offset,
      nameStartsWith: nameStartsWith ?? this.nameStartsWith,
    );
  }
}

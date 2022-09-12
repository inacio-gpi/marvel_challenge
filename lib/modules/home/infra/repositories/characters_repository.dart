import 'package:dartz/dartz.dart';
import 'package:marvel/core/error/failure.dart';
import 'package:marvel/modules/home/domain/entities/character_entity.dart';

import '../../domain/repositories/characters_repository.dart';
import '../datasources/characters_datasource.dart';
import '../models/character_model.dart';

class CharactersRepository extends ICharactersRepository {
  final ICharactersDataSource _charactersDataSource;

  CharactersRepository({required ICharactersDataSource charactersDataSource})
      : _charactersDataSource = charactersDataSource;

  @override
  Future<Either<Failure, List<CharacterEntity>>> getAllCharacters() async {
    try {
      final List<CharacterModel> characters =
          await _charactersDataSource.getAllCharacters();
      final List<CharacterEntity> charactersEntity =
          characters.map((e) => e.toEntity()).toList();
      return right(charactersEntity);
    } on Failure catch (e) {
      return left(e);
    }
  }
}

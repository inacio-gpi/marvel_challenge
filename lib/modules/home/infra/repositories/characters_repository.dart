import 'package:dartz/dartz.dart';
import 'package:marvel/core/error/failure.dart';
import 'package:marvel/modules/home/domain/entities/character_entity.dart';

import '../../../../core/network/network_info.dart';
import '../../domain/entities/character_filter_entity.dart';
import '../../domain/repositories/characters_repository.dart';
import '../datasources/characters_datasource.dart';
import '../models/character_model.dart';

class CharactersRepository extends ICharactersRepository {
  final ICharactersDataSource _charactersDataSource;
  final IInternetInfo _internetInfo;

  CharactersRepository({
    required ICharactersDataSource charactersDataSource,
    required IInternetInfo internetInfo,
  })  : _charactersDataSource = charactersDataSource,
        _internetInfo = internetInfo;

  @override
  Future<Either<Failure, List<CharacterEntity>>> getAllCharacters(
      [CharacterFilterEntity? param]) async {
    if (await _internetInfo.isConnected() == true) {
      try {
        final List<CharacterModel> characters =
            await _charactersDataSource.getAllCharacters(param);
        final List<CharacterEntity> charactersEntity =
            characters.map((e) => e.toEntity()).toList();
        return right(charactersEntity);
      } on Failure catch (e) {
        return left(e);
      }
    } else {
      return left(NetworkException(message: 'No connection'));
    }
  }
}

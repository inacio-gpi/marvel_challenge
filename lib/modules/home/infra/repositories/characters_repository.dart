import 'package:dartz/dartz.dart';
import 'package:marvel/core/error/failure.dart';
import 'package:marvel/modules/home/domain/entities/character_entity.dart';

import '../../../../core/loca_storage/interfaces/i_local_storage.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/character_filter_entity.dart';
import '../../domain/repositories/characters_repository.dart';
import '../datasources/characters_datasource.dart';
import '../models/character_model.dart';

class CharactersRepository extends ICharactersRepository {
  final ICharactersDataSource _charactersDataSource;
  final IInternetInfo _internetInfo;
  final ICharactersLocalStorage _localStorage;

  CharactersRepository({
    required ICharactersDataSource charactersDataSource,
    required IInternetInfo internetInfo,
    required ICharactersLocalStorage localStorage,
  })  : _charactersDataSource = charactersDataSource,
        _internetInfo = internetInfo,
        _localStorage = localStorage;

  @override
  Future<Either<Failure, List<CharacterEntity>>> getAllCharacters(
      [CharacterFilterEntity? param]) async {
    // GetStorage box = GetStorage();
    if (await _internetInfo.isConnected() == true) {
      try {
        final List<CharacterModel> characters =
            await _charactersDataSource.getAllCharacters(param);
        await _localStorage.add(characters);

        final List<CharacterEntity> charactersEntity =
            characters.map((e) => e.toEntity()).toList();

        return right(charactersEntity);
      } on Failure catch (e) {
        return left(e);
      }
    } else {
      final List<CharacterModel>? lastCachedRequest =
          await _localStorage.getAll();

      final List<CharacterEntity> charactersCachedEntity =
          lastCachedRequest?.map((e) => e.toEntity()).toList() ?? [];

      return left(
        NetworkException(
          message: 'No connection',
          data: charactersCachedEntity,
        ),
      );
    }
  }
}

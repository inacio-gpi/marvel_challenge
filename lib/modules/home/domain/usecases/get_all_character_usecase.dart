import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/character_entity.dart';
import '../repositories/characters_repository.dart';

abstract class IGetAllCharactersUseCase {
  Future<Either<Failure, List<CharacterEntity>>> call();
}

class GetAllCharactersUseCase implements IGetAllCharactersUseCase {
  late final ICharactersRepository _repository;

  GetAllCharactersUseCase({
    required ICharactersRepository repository,
  }) : _repository = repository;

  @override
  Future<Either<Failure, List<CharacterEntity>>> call() async {
    return await _repository.getAllCharacters();
  }
}

import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/character_entity.dart';

abstract class ICharactersRepository {
  Future<Either<Failure, List<CharacterEntity>>> getAllCharacters();
}

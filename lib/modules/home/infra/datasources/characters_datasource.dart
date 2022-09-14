import '../../domain/entities/character_filter_entity.dart';
import '../models/character_model.dart';

abstract class ICharactersDataSource {
  Future<List<CharacterModel>> getAllCharacters([CharacterFilterEntity? param]);
}

import '../models/character_model.dart';

abstract class ICharactersDataSource {
  Future<List<CharacterModel>> getAllCharacters();
}

import '../../../modules/home/infra/models/character_model.dart';

abstract class ICharactersLocalStorage {
  Future<void> add(List<CharacterModel> listParam);
  Future<List<CharacterModel>?> getAll();
  Future clear();
}

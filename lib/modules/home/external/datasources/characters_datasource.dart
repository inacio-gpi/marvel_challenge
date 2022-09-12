import '../../../../core/constants/api_routes.dart';
import '../../../../core/http/http_interface.dart';
import '../../infra/datasources/characters_datasource.dart';
import '../../infra/models/character_model.dart';

class CharactersDataSource extends ICharactersDataSource {
  final IHttpClient _http;

  CharactersDataSource({required IHttpClient http}) : _http = http;

  @override
  Future<List<CharacterModel>> getAllCharacters() async {
    final response = await _http.get(
      ApiRoutes.characters,
    );

    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw response.data;
    }
  }
}

import '../../../../core/constants/api_routes.dart';
import '../../../../core/http/http_interface.dart';
import '../../domain/entities/character_filter_entity.dart';
import '../../infra/datasources/characters_datasource.dart';
import '../../infra/models/character_filter_model.dart';
import '../../infra/models/character_model.dart';

class CharactersDataSource extends ICharactersDataSource {
  final IHttpClient _http;

  CharactersDataSource({required IHttpClient http}) : _http = http;

  @override
  Future<List<CharacterModel>> getAllCharacters(
      [CharacterFilterEntity? param]) async {
    final queryParams = CharacterFilterModel.fromEntity(entity: param).toMap();
    final response = await _http.get(
      ApiRoutes.characters,
      queryParameters: queryParams,
    );

    if (response.statusCode == 200) {
      final result = response.data['data']['results'] as List;
      return result.map((e) => CharacterModel.fromMap(e)).toList();
    } else {
      throw response.data;
    }
  }
}

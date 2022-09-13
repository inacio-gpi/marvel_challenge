import 'package:get/get.dart';

import '../../core/http/http_client_adapter.dart';
import '../../core/loca_storage/local_storage.dart';
import '../../core/network/network_info.dart';
import 'domain/usecases/get_all_character_usecase.dart';
import 'external/datasources/characters_datasource.dart';
import 'infra/repositories/characters_repository.dart';
import 'presenter/controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CharactersDataSource(http: Get.find<HttpClient>()));
    Get.lazyPut(() => CharactersRepository(
          charactersDataSource: Get.find<CharactersDataSource>(),
          internetInfo: Get.find<InternetInfo>(),
          localStorage: Get.find<CharacterLocalStorage>(),
        ));
    Get.lazyPut(() =>
        GetAllCharactersUseCase(repository: Get.find<CharactersRepository>()));
    Get.lazyPut(() => HomeController(
        getAllCharactersUseCase: Get.find<GetAllCharactersUseCase>()));
  }
}

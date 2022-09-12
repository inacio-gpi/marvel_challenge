import 'package:get/get.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/character_entity.dart';
import '../../domain/entities/character_filter_entity.dart';
import '../../domain/usecases/get_all_character_usecase.dart';

class HomeController extends GetxController {
  final IGetAllCharactersUseCase _getAllCharactersUseCase;
  HomeController({
    required IGetAllCharactersUseCase getAllCharactersUseCase,
  }) : _getAllCharactersUseCase = getAllCharactersUseCase;

  var characters = RxList<CharacterEntity>([]);
  var isLoading = RxBool(true);
  final int totalToFetch = 10;
  int offset = 0;

  Future<void> loadCharacters([CharacterFilterEntity? filterParam]) async {
    isLoading.value = true;
    final result = await _getAllCharactersUseCase(filterParam);
    result.fold(
      (l) {
        if (l is NetworkException) {
          Get.snackbar('Error', l.message);
        }
      },
      (r) {
        characters.addAll(r);
        offset += totalToFetch;
      },
    );
    isLoading.value = false;
  }

  // @override
  // Future onInit() async {
  //   super.onInit();
  //   _loadCharacters();
  // }
}

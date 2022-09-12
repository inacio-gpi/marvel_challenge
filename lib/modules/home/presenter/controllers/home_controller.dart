import 'package:get/get.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/character_entity.dart';
import '../../domain/usecases/get_all_character_usecase.dart';

class HomeController extends GetxController {
  final IGetAllCharactersUseCase _getAllCharactersUseCase;
  HomeController({
    required IGetAllCharactersUseCase getAllCharactersUseCase,
  }) : _getAllCharactersUseCase = getAllCharactersUseCase;

  var characters = RxList<CharacterEntity>([]);

  Future<void> _loadCharacters() async {
    final result = await _getAllCharactersUseCase();
    return result.fold(
      (l) => null,
      (r) {
        characters.addAll(r);
      },
    );
  }

  Future<void> loadMoreCharacters() async {
    final result = await _getAllCharactersUseCase();
    return result.fold(
      (l) {
        if (l is NetworkException) {
          Get.snackbar('Error', l.message);
        }
      },
      (r) {
        characters.addAll(r);
      },
    );
  }

  @override
  Future onInit() async {
    super.onInit();
    _loadCharacters();
  }
}

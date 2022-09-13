import 'package:flutter/material.dart';
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
  var isFirstLoading = RxBool(true);
  var isLoading = RxBool(true);
  final int totalToFetch = 10;
  int offset = 0;
  bool _isSearching = false;

  Future<void> loadCharacters([CharacterFilterEntity? filterParam]) async {
    isLoading.value = true;
    final result = await _getAllCharactersUseCase(filterParam);
    result.fold(
      (l) {
        if (l is NetworkException) {
          if (characters.isEmpty) {
            characters.addAll(l.data as List<CharacterEntity>);
          }
          // Get.snackbar('Error', l.message);
          if (!Get.isSnackbarOpen) {
            Get.snackbar('Error', l.message,
                backgroundColor: Colors.white.withOpacity(0.8));
          }
        }
      },
      (r) {
        characters.addAll(r);
        offset += totalToFetch;
      },
    );
    isFirstLoading.value = false;
    isLoading.value = false;
  }

  Future<void> searchCharacters(CharacterFilterEntity? filterParam) async {
    if (filterParam?.nameStartsWith?.isNotEmpty ?? false) {
      _isSearching = true;
    } else {
      _isSearching = false;
    }
    isFirstLoading.value = true;
    characters.clear();
    await loadCharacters(filterParam);
  }
  // @override
  // Future onInit() async {
  //   super.onInit();
  //   _loadCharacters();
  // }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:get_storage/get_storage.dart';

import '../../modules/home/infra/models/character_model.dart';
import 'interfaces/i_local_storage.dart';

class CharacterLocalStorage extends ICharactersLocalStorage {
  static String KEY_CHARACHTERS = 'KEY_CHARACHTERS';

  final GetStorage _box;

  CharacterLocalStorage({
    required GetStorage box,
  }) : _box = box;

  @override
  Future<void> add(List<CharacterModel> listParam) async {
    await _box.write(
      KEY_CHARACHTERS,
      json.encode(
        listParam.map((e) => e.toJson()).toList(),
      ),
    );
  }

  @override
  Future clear() {
    // TODO: implement clear
    throw UnimplementedError();
  }

  @override
  Future<List<CharacterModel>?> getAll() async {
    final result = _box.read(KEY_CHARACHTERS);
    return result is String
        ? json
            .decode(result)
            .map<CharacterModel>((e) => CharacterModel.fromJson(e))
            .toList()
        : null;
  }
}

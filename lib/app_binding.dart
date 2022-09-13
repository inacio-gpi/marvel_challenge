import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'core/http/http_client_adapter.dart';
import 'core/loca_storage/local_storage.dart';
import 'core/network/network_channel.dart';
import 'core/network/network_info.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Dio());
    Get.lazyPut(() => GetStorage());
    Get.lazyPut(() => HttpClient(Get.find<Dio>()));
    Get.lazyPut(() => CharacterLocalStorage(box: Get.find<GetStorage>()));
    Get.lazyPut(() => InternetPlatformChannel());
    Get.lazyPut(() =>
        InternetInfo(connectionChecker: Get.find<InternetPlatformChannel>()));
  }
}

import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'core/http/http_client_adapter.dart';
import 'core/network/network_channel.dart';
import 'core/network/network_info.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Dio());
    Get.lazyPut(() => HttpClient(Get.find<Dio>()));
    Get.lazyPut(() => InternetPlatformChannel());
    Get.lazyPut(() =>
        InternetInfo(connectionChecker: Get.find<InternetPlatformChannel>()));
  }
}

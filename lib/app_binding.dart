import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'core/http/http_client_adapter.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Dio());
    Get.lazyPut(() => HttpClient(Get.find<Dio>()));
  }
}

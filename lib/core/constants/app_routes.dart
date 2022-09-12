import 'package:get/get.dart';

import '../../modules/home/home_binding.dart';
import '../../modules/home/presenter/controllers/home_controller.dart';
import '../../modules/home/presenter/pages/home_page.dart';

class Routes {
  static const String home = '/home';
}

class Pages {
  static final pages = [
    GetPage(
      name: Routes.home,
      page: () => HomePage(
        controller: Get.find<HomeController>(),
      ),
      binding: HomeBinding(),
    ),
  ];
}

import 'package:get/get.dart';

import '../../modules/home/domain/entities/character_entity.dart';
import '../../modules/home/home_binding.dart';
import '../../modules/home/presenter/controllers/home_controller.dart';
import '../../modules/home/presenter/pages/details_page.dart';
import '../../modules/home/presenter/pages/home_page.dart';

class Routes {
  static const String home = '/home';
  static const String details = '/details';
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
    GetPage(
      name: Routes.details,
      page: () => DetailsPage(
        character: Get.arguments as CharacterEntity,
      ),
    ),
  ];
}

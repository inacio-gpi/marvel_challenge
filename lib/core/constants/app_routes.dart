import 'package:get/get.dart';

import '../../modules/home/presenter/pages/home_page.dart';

class Routes {
  static const String home = '/home';
}

class Pages {
  static final pages = [
    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
    ),
  ];
}

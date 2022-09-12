import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_binding.dart';
import 'core/constants/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Mottu Marvel',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: Routes.home,
      getPages: Pages.pages,
      initialBinding: AppBinding(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_routes.dart';
import '../controllers/home_controller.dart';
import '../widgets/character_card_widget.dart';

class HomePage extends StatelessWidget {
  final HomeController controller;
  const HomePage({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Obx(
                  () => ListView.builder(
                    itemCount: controller.characters.length,
                    itemBuilder: (BuildContext context, int index) {
                      final character = controller.characters[index];
                      return CharacterCardWidget(
                        character: character,
                        onTap: () {
                          Get.toNamed(Routes.details, arguments: character);
                        },
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

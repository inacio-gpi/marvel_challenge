// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../widgets/character_card_widget.dart';

class HomePage extends StatefulWidget {
  final HomeController controller;
  const HomePage({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

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
                    itemCount: widget.controller.characters.length,
                    itemBuilder: (BuildContext context, int index) {
                      final character = widget.controller.characters[index];
                      return CharacterCardWidget(character: character);
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

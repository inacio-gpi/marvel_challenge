import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/entities/character_entity.dart';

class DetailsPage extends StatelessWidget {
  final CharacterEntity character;
  const DetailsPage({
    Key? key,
    required this.character,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF181818),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leadingWidth: 75,
        toolbarHeight: 75,
        leading: Center(
          child: InkWell(
            onTap: () {
              Get.back();
            },
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: const Color(0xFFB50607),
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Icon(
                Icons.keyboard_arrow_left_sharp,
                size: 28,
              ),
            ),
          ),
        ),
      ),
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            flex: 4,
            child: Hero(
              tag: 'character_${character.id}',
              child: Image.network(
                character.imageUrl,
                alignment: Alignment.center,
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(children: [
                Text(
                  character.name,
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.white.withOpacity(0.8),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  character.description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white.withOpacity(0.6),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ]),
            ),
          ),
        ],
      )),
    );
  }
}

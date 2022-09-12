import 'package:flutter/material.dart';

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
      body: SafeArea(
        child: Center(
            child: Column(
          children: [
            Hero(
              tag: 'character_${character.id}',
              child: Image.network(character.imageUrl),
            ),
            const SizedBox(height: 16),
            Text(
              character.name,
              style: const TextStyle(fontSize: 28),
            ),
            const SizedBox(height: 16),
            Text(
              character.description,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        )),
      ),
    );
  }
}

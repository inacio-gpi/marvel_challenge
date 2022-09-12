import 'package:flutter/material.dart';
import 'package:marvel/modules/home/domain/entities/character_entity.dart';

class CharacterCardWidget extends StatelessWidget {
  const CharacterCardWidget({
    Key? key,
    required this.character,
  }) : super(key: key);
  final CharacterEntity character;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: Row(
        children: [
          SizedBox(
            height: 45,
            width: 45,
            child: Image.network(character.imageUrl),
          ),
          const SizedBox(width: 12),
          Text(character.name),
        ],
      ),
    );
  }
}

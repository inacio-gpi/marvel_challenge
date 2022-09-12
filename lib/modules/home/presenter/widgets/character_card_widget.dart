// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:marvel/modules/home/domain/entities/character_entity.dart';

class CharacterCardWidget extends StatelessWidget {
  final CharacterEntity character;
  final void Function()? onTap;

  const CharacterCardWidget({
    Key? key,
    required this.character,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
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
              child: Hero(
                tag: 'character_${character.id}',
                child: Image.network(character.imageUrl),
              ),
            ),
            const SizedBox(width: 12),
            Text(character.name),
          ],
        ),
      ),
    );
  }
}

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
        margin: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        child: Material(
          elevation: 10,
          child: Column(
            children: [
              Expanded(
                flex: 8,
                child: Hero(
                  tag: 'character_${character.id}',
                  child: Image.network(
                    alignment: Alignment.center,
                    height: double.infinity,
                    width: double.infinity,
                    character.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  alignment: Alignment.center,
                  color: const Color(0xFFF0141E),
                  child: Text(
                    character.name,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

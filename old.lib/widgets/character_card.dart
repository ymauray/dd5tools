import 'package:flutter/material.dart';

import '../models/characer.dart';
import 'typography/body_small.dart';
import 'typography/title_medium.dart';

class CharacterCard extends StatefulWidget {
  const CharacterCard(
    Character character, {
    Key? key,
  })  : _character = character,
        super(key: key);

  final Character _character;

  @override
  State<CharacterCard> createState() => _CharacterCardState();
}

class _CharacterCardState extends State<CharacterCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage("assets/paper_small_bg.png"),
          fit: BoxFit.cover,
        ),
        border: Border.all(
          color: const Color(0xFFc9ad6a),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: ListTile(
        title: TitleMedium(widget._character.name),
        subtitle: BodySmall(widget._character.tagline ?? ''),
        onTap: () {
          debugPrint("Hello, ${widget._character.name}");
        },
      ),
    );
  }
}

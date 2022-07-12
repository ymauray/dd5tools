import 'package:flutter/material.dart';

import '../models/characer.dart';
import 'typography/body_small.dart';
import 'typography/title_medium.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard(Character character, {Key? key})
      : _character = character,
        super(key: key);

  final Character _character;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        //color: const Color(0xFFBBBBBB),
        //backgroundBlendMode: BlendMode.colorBurn,
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
        title: TitleMedium(_character.name),
        subtitle: BodySmall(_character.tagline ?? ''),
        onTap: () {
          debugPrint("Hello, ${_character.name}");
        },
      ),
    );
  }
}

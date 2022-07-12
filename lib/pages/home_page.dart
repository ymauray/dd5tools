import 'package:dd5tools/widgets/paper_container.dart';
import 'package:dd5tools/widgets/typography/body_small.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/characer.dart';
import '../widgets/typography/title_medium.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final characters = context.read<List<Character>>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mes personnages'),
        centerTitle: true,
      ),
      body: PaperContainer(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
              ).copyWith(
                top: 8.0,
                bottom: 0.0,
              ),
              child: CharacterCard(characters[index]),
            );
          },
          itemCount: characters.length,
        ),
      ),
    );
  }
}

class CharacterCard extends StatelessWidget {
  const CharacterCard(Character character, {Key? key})
      : _character = character,
        super(key: key);

  final Character _character;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFBBBBBB),
        backgroundBlendMode: BlendMode.colorBurn,
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

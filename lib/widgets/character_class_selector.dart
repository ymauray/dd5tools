import 'package:dd5tools/widgets/title_large.dart';
import 'package:flutter/material.dart';

import '../models/character_class.dart';
import 'character_class_card.dart';
import 'paper_container.dart';

class CharacterClassSelector extends StatelessWidget {
  const CharacterClassSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Classe'),
      ),
      body: PaperContainer(
        child: ListView.builder(
          itemCount: CharacterClass.list.length + 1,
          itemBuilder: (context, index) {
            return index == 0
                ? Padding(
                    padding: const EdgeInsets.all(16.0).copyWith(bottom: 0),
                    child:
                        const TitleLarge('Choisissez la classe du personnage'),
                  )
                : CharacterClassCard(CharacterClass.list[index - 1]);
          },
        ),
      ),
    );
  }
}

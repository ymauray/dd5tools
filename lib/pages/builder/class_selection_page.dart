import 'package:dd5tools/widgets/title_large.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../cubit/character_builder_cubit.dart';
import '../../models/character_class.dart';
import '../../widgets/character_class_card.dart';
import '../../widgets/paper_container.dart';

class ClassSelectionPage extends StatelessWidget {
  const ClassSelectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.read<CharacterBuilderCubit>().displayRaceTraits();
          },
        ),
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

import 'package:dd5tools/models/character_class.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../cubit/character_builder_cubit.dart';

class CharacterClassCard extends StatelessWidget {
  const CharacterClassCard(CharacterClass characterClass, {Key? key})
      : _characterClass = characterClass,
        super(key: key);

  final CharacterClass _characterClass;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 4.0,
        horizontal: 8.0,
      ),
      child: Card(
        child: ListTile(
          enabled: _characterClass.enabled,
          title: Text(_characterClass.name),
          onTap: () {
            context.read<CharacterBuilderCubit>().selectClass(_characterClass);
          },
        ),
      ),
    );
  }
}

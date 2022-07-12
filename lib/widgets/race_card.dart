import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../cubit/character_builder_cubit.dart';
import '../models/race.dart';

class RaceCard extends StatelessWidget {
  const RaceCard(
    this.race, {
    Key? key,
  }) : super(key: key);

  final Race race;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 4.0,
        horizontal: 8.0,
      ),
      child: Card(
        child: ListTile(
          enabled: race.enabled,
          title: Text(race.name),
          onTap: () {
            context.read<CharacterBuilderCubit>().selectRace(race);
          },
        ),
      ),
    );
  }
}

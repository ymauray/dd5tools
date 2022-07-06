import 'package:flutter/material.dart';

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
          onTap: () {},
        ),
      ),
    );
  }
}

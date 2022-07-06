import 'package:dd5tools/models/race.dart';
import 'package:dd5tools/widgets/title_large.dart';
import 'package:flutter/material.dart';

import '../widgets/race_card.dart';

class ChooseRace extends StatelessWidget {
  const ChooseRace({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Race'),
      ),
      body: ListView.builder(
        itemCount: Race.list.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.all(16.0).copyWith(bottom: 0),
              child: const TitleLarge('Choisissez la race de votre personnage'),
            );
          } else {
            return RaceCard(Race.list[index - 1]);
          }
        },
      ),
    );
  }
}

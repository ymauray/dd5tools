import 'package:flutter/material.dart';

import '../../models/race.dart';
import '../../widgets/paper_container.dart';
import '../../widgets/race_card.dart';
import '../../widgets/title_large.dart';

class RaceSelectionPage extends StatelessWidget {
  const RaceSelectionPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text('Race'),
      ),
      body: PaperContainer(
        child: ListView.builder(
          itemCount: Race.list.length + 1,
          itemBuilder: (context, index) {
            return index == 0
                ? Padding(
                    padding: const EdgeInsets.all(16.0).copyWith(bottom: 0),
                    child: const TitleLarge('Choisissez la race du personnage'),
                  )
                : RaceCard(Race.list[index - 1]);
          },
        ),
      ),
    );
  }
}

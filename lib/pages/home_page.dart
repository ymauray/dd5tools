import 'package:dd5tools/cubit/character_builder_cubit.dart';
import 'package:dd5tools/widgets/title_large.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/character.dart';
import '../widgets/paper_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  final int fakeCount = 0;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CharacterBuilderCubit>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('DD5Tools'),
      ),
      body: PaperContainer(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0).copyWith(bottom: 0),
              child: const TitleLarge('Mes personnages'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: fakeCount,
                itemBuilder: (BuildContext context, int index) {
                  return const Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                    child: Card(
                      child: ListTile(
                        title: Text('Personnage'),
                        subtitle: Text('Description'),
                      ),
                    ),
                  );
                },
              ),
            ),
            Column(
              children: [
                Divider(
                  color: Colors.red.shade900,
                  thickness: 1,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      final character = await Navigator.of(context)
                          .pushNamed<Character?>('build_character');
                      // ignore: no-empty-block
                      if (character != null) {
                        /* Do something clever */
                      }
                      cubit.init();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Ajouter un personnage',
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: Colors.white,
                                ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

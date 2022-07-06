import 'package:dd5tools/widgets/title_large.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  final int fakeCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DD5Tools'),
      ),
      body: ListView.builder(
        itemCount: fakeCount + 2,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.all(16.0).copyWith(bottom: 0),
              child: const TitleLarge('Mes personnages'),
            );
          } else if (index == fakeCount + 1) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('choose_race');
                  },
                  child: Text(
                    'Ajouter un personnage',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
              ],
            );
          } else {
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
              child: Card(
                child: ListTile(
                  title: Text('Personnage'),
                  subtitle: Text('Description'),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

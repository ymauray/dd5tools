import 'package:dd5tools/widgets/paper_container.dart';
import 'package:dd5tools/widgets/typography/body_small.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/characer.dart';
import '../widgets/character_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _modify = false;
  bool _deleteAll = true;
  List<bool> _selected = <bool>[];

  @override
  void initState() {
    super.initState();
    _modify = false;
  }

  @override
  Widget build(BuildContext context) {
    final characters = context.read<List<Character>>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mes personnages'),
        actions: [
          if (!_modify)
            TextButton(
              onPressed: () {
                setState(() {
                  _selected = List<bool>.filled(characters.length, false);
                  _modify = true;
                  _deleteAll = true;
                });
              },
              child: const Text(
                'Modifier',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          if (_modify)
            TextButton(
              onPressed: () {
                setState(() {
                  _modify = false;
                });
              },
              child: const Text(
                'Annuler',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
        ],
      ),
      body: PaperContainer(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 50.0),
              child: Scrollbar(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                        left: _modify ? 0.0 : 8.0,
                        right: 8.0,
                      ).copyWith(
                        top: index == 0 ? 8.0 : 0.0,
                        bottom: 8.0,
                      ),
                      child: Row(
                        children: [
                          if (_modify) ...[
                            Checkbox(
                              value: _selected[index],
                              onChanged: (value) {
                                setState(() {
                                  _selected[index] = value ?? false;
                                  _deleteAll = _selected
                                      .where((element) => element)
                                      .isEmpty;
                                });
                              },
                            ),
                          ],
                          Expanded(
                            child: CharacterCard(
                              characters[index],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: characters.length,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: SizedBox(
                height: 50.0,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/paper_small_bg.png"),
                      fit: BoxFit.cover,
                    ),
                    border: Border(
                      top: BorderSide(
                        color: Color(0xFFc9ad6a),
                        width: 1.0,
                      ),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (!_modify) ...[
                        const SizedBox(
                          width: 48,
                        ),
                        const BodySmall(
                          '3 personnages chargés',
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.add,
                          ),
                        ),
                      ],
                      if (_modify) ...[
                        const SizedBox(
                          width: 48,
                        ),
                        const SizedBox(
                          width: 48,
                        ),
                        if (_deleteAll)
                          TextButton(
                            onPressed: () {},
                            child: const Text("Tout supprimer"),
                          ),
                        if (!_deleteAll)
                          TextButton(
                            onPressed: () {},
                            child: const Text("Supprimer"),
                          ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

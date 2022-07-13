import 'package:dd5tools/providers/character_provider.dart';
import 'package:dd5tools/widgets/paper_container.dart';
import 'package:dd5tools/widgets/typography/title_small.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/characer.dart';
import '../widgets/character_card.dart';
import '../widgets/typography/body_small.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _modify = false;
  List<Character> _characters = [];

  @override
  void initState() {
    super.initState();
    _modify = false;
    _getCharacters();
  }

  void _getCharacters() async {
    final characterProvider =
        Provider.of<CharacterProvider>(context, listen: false);
    _characters = await characterProvider.getCharacters();
    // ignore: no-empty-block
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var s = _characters.length > 1 ? 's' : '';
    var statusLine = '${_characters.length} personnage$s chargé$s';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mes personnages'),
        centerTitle: false,
        actions: [
          if (!_modify)
            TextButton(
              onPressed: () {
                setState(() {
                  _modify = true;
                });
              },
              child: const Text(
                'Modifier',
                style: TextStyle(color: Colors.white),
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
                style: TextStyle(color: Colors.white),
              ),
            ),
        ],
      ),
      body: PaperContainer(
        child: Consumer<CharacterProvider>(
          builder: (context, characterProvider, child) {
            return Stack(
              children: [
                _DeletableCharacterCard(
                  _characters,
                  modify: _modify,
                  onDelete: (index) {
                    setState(() {
                      _characters.removeAt(index);
                      _modify = false;
                    });
                  },
                ),
                if (!_modify)
                  _Footer(
                    children: [
                      const SizedBox(width: 48),
                      BodySmall(statusLine),
                      IconButton(
                        // ignore: no-empty-block
                        onPressed: () {},
                        icon: const Icon(Icons.add),
                      ),
                    ],
                  ),
                if (_modify)
                  _Footer(
                    children: [
                      const SizedBox(width: 48),
                      const SizedBox(width: 48),
                      TextButton(
                        onPressed: () async {
                          var delete = await _confirmDelete(
                            context,
                            'Voulez-vous vraiment supprimer tous les personnages ?',
                          );
                          if (delete ?? false) {
                            _characters.removeWhere((element) => true);
                            setState(() {
                              _modify = false;
                            });
                          }
                        },
                        child: const BodySmall("Tout supprimer"),
                      ),
                    ],
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _DeletableCharacterCard extends StatelessWidget {
  const _DeletableCharacterCard(
    List<Character> data, {
    Function(int index)? onDelete,
    Key? key,
    required bool modify,
  })  : _data = data,
        _onDelete = onDelete,
        _modify = modify,
        super(key: key);

  final bool _modify;
  final List<Character> _data;
  final Function(int index)? _onDelete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 75.0),
      child: Scrollbar(
        child: ListView.builder(
          itemCount: _data.length,
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
                  if (_modify)
                    IconButton(
                      onPressed: () async {
                        var delete = await _confirmDelete(
                          context,
                          'Voulez-vous vraiment supprimer ${_data[index].name} ?',
                        );
                        if (delete ?? false) {
                          _onDelete?.call(index);
                        }
                      },
                      icon: const Icon(Icons.delete),
                    ),
                  Expanded(child: CharacterCard(_data[index])),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

Future<bool?> _confirmDelete(
  BuildContext context,
  String prompt,
) async {
  return showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: const TitleSmall('Supprimer'),
      content: BodySmall(prompt),
      actions: [
        TextButton(
          child: const BodySmall('Supprimer'),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        ),
        TextButton(
          child: const BodySmall('Annuler'),
          onPressed: () {
            Navigator.of(context).pop(false);
          },
        ),
      ],
    ),
  );
}

class _Footer extends StatelessWidget {
  const _Footer({required List<Widget> children, Key? key})
      : _children = children,
        super(key: key);

  final List<Widget> _children;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: SizedBox(
        height: 75.0,
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: _children,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

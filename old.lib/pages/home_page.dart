import 'dart:io';

import 'package:dd5tools/paper_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';

import '../models/characer.dart';
import '../providers/character_provider.dart';
import '../widgets/character_card.dart';
import '../widgets/typography/body_medium.dart';
import '../widgets/typography/body_small.dart';
import '../widgets/typography/title_small.dart';

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
                _CharacterList(
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
                      FutureBuilder<PackageInfo>(
                        future: PackageInfo.fromPlatform(),
                        initialData: PackageInfo(
                          appName: 'Not available',
                          packageName: 'Not available',
                          version: '0.0.0',
                          buildNumber: '0',
                        ),
                        builder: (context, snapshot) {
                          return Column(
                            children: [
                              BodySmall(statusLine),
                              if (snapshot.hasData)
                                BodySmall(
                                  'Version ${snapshot.data!.version} (${snapshot.data!.buildNumber})',
                                ),
                            ],
                          );
                        },
                      ),
                      IconButton(
                        // ignore: no-empty-block
                        onPressed: () async {
                          var character = await _newCharacter(context);
                          if (character != null) {
                            setState(() {
                              _characters.add(character);
                              _characters.sort((a, b) => a.name
                                  .toUpperCase()
                                  .compareTo(b.name.toUpperCase()));
                            });
                          }
                        },
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

class _CharacterList extends StatelessWidget {
  const _CharacterList(
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
      padding: EdgeInsets.only(bottom: Platform.isIOS ? 75.0 : 50.0),
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
      content: BodyMedium(prompt),
      actions: [
        TextButton(
          child: const BodyMedium('Supprimer'),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        ),
        TextButton(
          child: const BodyMedium('Annuler'),
          onPressed: () {
            Navigator.of(context).pop(false);
          },
        ),
      ],
    ),
  );
}

// ignore: long-method
Future<Character?> _newCharacter(BuildContext context) async {
  final formKey = GlobalKey<FormBuilderState>();

  return showDialog<Character>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const TitleSmall('Nouveau personnage'),
        content: FormBuilder(
          key: formKey,
          onChanged: () {
            formKey.currentState!.save();
            debugPrint(formKey.currentState!.value.toString());
          },
          autovalidateMode: AutovalidateMode.disabled,
          initialValue: const {
            'name': '',
            'tagline': '',
          },
          skipDisabled: true,
          child: const _NewCharacterForm(),
        ),
        actions: [
          TextButton(
            child: const BodyMedium('Ajouter'),
            onPressed: () {
              if (formKey.currentState?.saveAndValidate() ?? false) {
                Navigator.of(context).pop(
                  Character(
                    name: formKey.currentState!.value['name'] as String,
                    tagline: formKey.currentState!.value['tagline'] as String,
                  ),
                );
                debugPrint(formKey.currentState?.value.toString());
              } else {
                debugPrint(formKey.currentState?.value.toString());
                debugPrint('validation failed');
              }
            },
          ),
          TextButton(
            child: const BodyMedium('Annuler'),
            onPressed: () {
              Navigator.of(context).pop(null);
            },
          ),
        ],
      );
    },
  );
}

class _NewCharacterForm extends StatelessWidget {
  const _NewCharacterForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FormBuilderTextField(
          style: Theme.of(context).textTheme.bodyMedium,
          name: 'name',
          decoration: const InputDecoration(
            labelText: 'Nom',
            floatingLabelBehavior: FloatingLabelBehavior.always,
          ),
          validator: FormBuilderValidators.required(),
          textInputAction: TextInputAction.next,
        ),
        FormBuilderTextField(
          style: Theme.of(context).textTheme.bodyMedium,
          name: 'tagline',
          decoration: const InputDecoration(
            labelText: 'Sous-titre',
            floatingLabelBehavior: FloatingLabelBehavior.always,
          ),
          textInputAction: TextInputAction.next,
        ),
      ],
    );
  }
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
        height: Platform.isIOS ? 75.0 : 50.0,
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

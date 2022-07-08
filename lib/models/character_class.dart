import 'package:dd5tools/models/character_class/paladin.dart';

abstract class CharacterClass {
  static var list = [
    const ClassImpl("Barbare"),
    const ClassImpl("Barde"),
    const ClassImpl("Clerc"),
    const ClassImpl("Druide"),
    const ClassImpl("Ensorceleur"),
    const ClassImpl("Guerrier"),
    const ClassImpl("Magicien"),
    const ClassImpl("Moine"),
    const ClassImpl("Occultiste"),
    const Paladin(),
    const ClassImpl("Rôdeur"),
    const ClassImpl("Roublard"),
  ];

  const CharacterClass(String name, {bool enabled = false})
      : _name = name,
        _enabled = enabled;

  final String _name;
  final bool _enabled;

  String get name => _name;
  bool get enabled => _enabled;
}

class ClassImpl extends CharacterClass {
  const ClassImpl(String name) : super(name, enabled: false);
}

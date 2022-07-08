import 'races/dwarf.dart';
import 'trait.dart';

abstract class Race {
  static var list = [
    const RaceImpl('Haut-elfe'),
    const RaceImpl('Elfe des bois'),
    const RaceImpl('Elfe noir'),
    const RaceImpl('Halfelin pied-léger'),
    const RaceImpl('Halfelin robuste'),
    const RaceImpl('Humain'),
    const RaceImpl('Nain des collines'),
    const NainDesMontagnes(),
    const RaceImpl('Demi-elfe'),
    const RaceImpl('Demi-orc'),
    const RaceImpl('Drakéide'),
    const RaceImpl('Gnome des forêts'),
    const RaceImpl('Gnome des roches'),
    const RaceImpl('Tieffelin'),
  ];

  const Race(String name, {bool enabled = false})
      : _name = name,
        _enabled = enabled;

  final String _name;
  final bool _enabled;

  String get name => _name;
  bool get enabled => _enabled;

  String get description;
  List<AbilityScoreIncrease> get increases => [];
  Size get size;
  Speed get speed;
  Vision? get vision => null;
  List<Language> get languages;
  List<Trait> get traits;
}

class RaceImpl extends Race {
  const RaceImpl(String name) : super(name, enabled: false);

  @override
  String get description => '';

  @override
  Size get size => const Size("S", 0.0, 0.0);

  @override
  Speed get speed => Speed(0.0);

  @override
  List<Language> get languages => [];

  @override
  List<Trait> get traits => <Trait>[];
}

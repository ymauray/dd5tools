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

  const Race(this.name, {this.enabled = false});

  String get description;
  List<AbilityScoreIncrease> get increases => [];
  Size get size;
  Speed get speed;
  Vision? get vision => null;
  List<Language> get languages;
  List<Trait> get traits;

  final String name;
  final bool enabled;
}

class RaceImpl extends Race {
  const RaceImpl(String name) : super(name, enabled: false);

  @override
  get description => '';

  @override
  get size => const Size("S", 0.0, 0.0);

  @override
  get speed => Speed(0.0);

  @override
  get languages => [];

  @override
  get traits => <Trait>[];
}

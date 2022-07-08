class Trait {
  const Trait(
    String label,
    String description, {
    List<String>? choices,
  })  : _label = label,
        _description = description,
        _choices = choices;

  final String _label;
  final String _description;
  final List<String>? _choices;

  String get label => _label;
  String get description => _description;
  bool get needsChoices => _choices != null && _choices!.isNotEmpty;
  List<String> get choices => _choices ?? [];
}

class Ability {
  const Ability(String name) : _name = name;

  final String _name;

  String get name => _name;

  static const Ability force = Ability("Force");
  static const Ability dexterite = Ability("Dextérité");
  static const Ability constitution = Ability("Constitution");
  static const Ability intelligence = Ability("Intelligence");
  static const Ability sagesse = Ability("Sagesse");
  static const Ability charisme = Ability("Charisme");
}

class AbilityScoreIncrease {
  AbilityScoreIncrease(Ability ability, int increase)
      : _ability = ability,
        _increase = increase;

  final Ability _ability;
  final int _increase;

  Ability get ability => _ability;
  int get increase => _increase;
}

class Size {
  const Size(String label, double min, double max)
      : _label = label,
        _min = min,
        _max = max;

  final String _label;
  final double _min;
  final double _max;

  String get label => _label;
  double get min => _min;
  double get max => _max;
}

class Speed {
  Speed(double value) : _value = value;

  final double _value;

  double get value => _value;
}

class Vision {
  Vision(String value, String description)
      : _value = value,
        _description = description;

  final String _value;
  final String _description;

  String get value => _value;
  String get description => _description;
}

class Language {
  Language(String value) : _value = value;

  final String _value;

  String get value => _value;
}

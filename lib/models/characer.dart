class Character {
  const Character(String name, {String? tagline})
      : _name = name,
        _tagline = tagline;

  final String _name;
  final String? _tagline;

  String get name => _name;
  String? get tagline => _tagline;
}

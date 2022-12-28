import 'dart:convert';

class Character {
  final String name;
  final String? tagline;
  int selected;
  Character({
    required this.name,
    this.tagline,
    this.selected = 0,
  });

  Character copyWith({
    String? name,
    String? tagline,
    int? selected,
  }) {
    return Character(
      name: name ?? this.name,
      tagline: tagline ?? this.tagline,
      selected: selected ?? this.selected,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'tagline': tagline,
      'selected': selected,
    };
  }

  factory Character.fromMap(Map<String, dynamic> map) {
    return Character(
      name: map['name'] ?? '',
      tagline: map['tagline'],
      selected: map['selected']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Character.fromJson(String source) =>
      Character.fromMap(json.decode(source));

  @override
  String toString() =>
      'Character(name: $name, tagline: $tagline, selected: $selected)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Character &&
        other.name == name &&
        other.tagline == tagline &&
        other.selected == selected;
  }

  @override
  int get hashCode => name.hashCode ^ tagline.hashCode ^ selected.hashCode;
}

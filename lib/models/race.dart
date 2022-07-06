class Race {
  static var list = [
    const Race('Haut-elfe'),
    const Race('Elfe des bois'),
    const Race('Elfe noir'),
    const Race('Halfelin pied-léger'),
    const Race('Halfelin robuste'),
    const Race('Humain'),
    const Race('Nain des collines'),
    const Race('Nain des montagnes', enabled: true),
    const Race('Demi-elfe'),
    const Race('Demi-orc'),
    const Race('Drakéide'),
    const Race('Gnome des forêts'),
    const Race('Gnome des roches'),
    const Race('Tieffelin'),
  ];

  const Race(this.name, {this.enabled = false});

  final String name;
  final bool enabled;
}

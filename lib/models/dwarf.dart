import 'race.dart';
import 'trait.dart';

abstract class Nain extends Race {
  const Nain(String name) : super(name, enabled: true);

  @override
  get description =>
      "Téméraires et robustes, les nains sont reconnus être aussi habiles en "
      "tant que guerriers, mineurs ou artisans de la pierre et du métal.";

  @override
  get increases => [
        AbilityScoreIncrease(Ability.constitution, 2),
      ];

  @override
  get size => const Size("M", 1.20, 1.50);

  @override
  get speed => Speed(7.50);

  @override
  get vision => Vision("Vision dans le noir (18m)");

  @override
  get languages => [Language("Commun"), Language("Nain")];

  @override
  get traits => [
        const Trait(
          "Résistance naine",
          "Vous avez un avantage aux jets de sauvegarde contre le poison et "
              "obtenez la résistance contre les dégâts de poison.",
        ),
        const Trait(
          "Entraînement aux armes naines",
          "Vous obtenez la maîtrise des hachettes, des haches d'armes, des "
              "marteaux légers et des marteaux de guerre.",
        ),
        const Trait(
          "Maîtrise des outils",
          "Vous obtenez la maîtrise d'un des outils d'artisan suivant au choix "
              ": outils de forgeron, outils de brasseur ou outils de maçon.",
        ),
        const Trait(
          "Connaissance de la pierre",
          "Chaque fois que vous effectuez un jet d'Intelligence (Histoire) en "
              "relation avec l'origine d'un travail lié à la pierre, "
              "considérez que vous maîtrisez la compétence Histoire et ajoutez "
              "le double de votre bonus de maîtrise au jet, au lieu du bonus "
              "de maîtrise normal.",
        ),
      ];
}

class NainDesMontagnes extends Nain {
  const NainDesMontagnes() : super("Nain des montagnes");

  @override
  String get description =>
      "${super.description}\n\nEn tant que nain des montagnes, vous êtes fort "
      "et robuste, et habitué à une vie difficile en terrain accidenté. Vous "
      "êtes probablement plus grand que la moyenne (pour un nain) et votre "
      "peau est plus claire. Les nains d'écu au nord de Faerûn sont des nains "
      "des montagnes.";

  @override
  get increases => [
        ...super.increases,
        AbilityScoreIncrease(Ability.force, 2),
      ];

  @override
  List<Trait> get traits => [
        ...super.traits,
        const Trait(
          "Formation au port des armures naines",
          "Vous maîtrisez les armures légères et intermédiaires.",
        ),
      ];
}

import 'package:dd5tools/cubit/character_builder_cubit.dart';
import 'package:dd5tools/widgets/app_scroll_view.dart';
import 'package:dd5tools/widgets/title_large.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RaceTraitsPage extends StatelessWidget {
  const RaceTraitsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CharacterBuilderCubit>();
    final race = cubit.race!;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.read<CharacterBuilderCubit>().init();
          },
        ),
        title: const Text('Traits de la race'),
      ),
      body: AppScrollView(
        children: [
          TitleLarge(
            race.name,
          ),
          Text(
            race.description,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          if (race.increases.isNotEmpty)
            Section(
              title: "Augmentation de caractéristiques",
              children: [
                Text(
                  race.increases
                      .map(
                        (increase) =>
                            "${increase.ability.name}: +${increase.increase}",
                      )
                      .toList()
                      .join(", "),
                ),
              ],
            ),
          Section(
            title: "Taille",
            inline: true,
            children: [
              Text(race.size.label),
            ],
          ),
          Section(
            title: "Vitesse",
            inline: true,
            children: [Text("${race.speed.value} m / round")],
          ),
          if (race.vision != null)
            Section(
              title: "Vision",
              inline: true,
              children: [Text(race.vision!.value)],
            ),
          Section(
            title: "Langues",
            inline: true,
            children: [
              Text(
                race.languages
                    .map((language) => language.value)
                    .toList()
                    .join(", "),
              ),
            ],
          ),
          Section(
            title: "Traits",
            children: race.traits
                .map((trait) => Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text(
                              trait.label,
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ),
                          Text(trait.description),
                        ],
                      ),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class Section extends StatelessWidget {
  const Section({
    required String title,
    required List<Widget> children,
    bool inline = false,
    Key? key,
  })  : _title = title,
        _children = children,
        _inline = inline,
        super(key: key);

  final String _title;
  final List<Widget> _children;
  final bool _inline;

  @override
  Widget build(BuildContext context) {
    return _inline
        ? Row(
            children: [
              Text(_title, style: Theme.of(context).textTheme.titleMedium),
              const Text(" : "),
              ..._children,
            ],
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(_title, style: Theme.of(context).textTheme.titleMedium),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _children,
                ),
              ),
            ],
          );
  }
}

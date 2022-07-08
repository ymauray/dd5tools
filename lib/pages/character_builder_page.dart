import 'package:dd5tools/cubit/character_builder_cubit.dart';
import 'package:dd5tools/pages/builder/race_traits_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'builder/race_selection_page.dart';

class CharacterBuilderPage extends StatelessWidget {
  const CharacterBuilderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CharacterBuilderCubit, CharacterBuilderState>(
      // ignore: no-empty-block
      listener: (context, state) {},
      builder: (context, state) {
        if (state is CharacterBuilderInitial) {
          return const RaceSelectionPage();
        } else if (state is CharacterBuilderRaceSelected) {
          return const RaceTraitsPage();
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

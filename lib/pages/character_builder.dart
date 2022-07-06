import 'package:dd5tools/cubit/character_builder_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/race_confirm.dart';
import '../widgets/race_selector.dart';

class CharacterBuilder extends StatelessWidget {
  const CharacterBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CharacterBuilderCubit, CharacterBuilderState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is CharacterBuilderInitial) {
          return const RaceSelector();
        } else if (state is CharacterBuilderRaceSelected) {
          return const RaceConfirm();
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

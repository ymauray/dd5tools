import 'package:dd5tools/cubit/character_builder_cubit.dart';
import 'package:dd5tools/widgets/paper_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharacterBuilderPage extends StatelessWidget {
  const CharacterBuilderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CharacterBuilderCubit, CharacterBuilderState>(
      // ignore: no-empty-block
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {},
            ),
            title: () {
              if (state is RaceSelection) {
                return const Text("Race");
              } else if (state is ClassSelection) {
                return const Text("Classe");
              }
            }(),
          ),
          body: const PaperContainer(
            child: Center(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        );
        //if (state is CharacterBuilderInitial) {
        //  return const RaceSelectionPage();
        //} else if (state is DisplayRaceTraits) {
        //  return const RaceTraitsPage();
        //} else if (state is DisplayClassSelection) {
        //  return const ClassSelectionPage();
        //} else {
        //  return const Center(child: CircularProgressIndicator());
        //}
      },
    );
  }
}

import 'package:dd5tools/models/race.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'character_builder_state.dart';

class CharacterBuilderCubit extends Cubit<CharacterBuilderState> {
  CharacterBuilderCubit() : super(CharacterBuilderInitial());

  Race? race;

  void init() {
    emit(CharacterBuilderInitial());
  }

  void selectRace(race) {
    this.race = race;
    emit(CharacterBuilderRaceSelected());
  }
}

import 'package:dd5tools/models/character.dart';
import 'package:dd5tools/models/character_class.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/race.dart';

part 'character_builder_state.dart';

class CharacterBuilderCubit extends Cubit<CharacterBuilderState> {
  CharacterBuilderCubit() : super(CharacterBuilderInitial());

  Character? _character;

  Race? get race => _character?.race;

  void newCharacter() {
    _character = Character();
  }

  void init() {
    emit(CharacterBuilderInitial());
  }

  void selectRace(race) {
    _character!.race = race;
    emit(CharacterBuilderRaceSelected());
  }

  // ignore: no-empty-block
  void selectClass(CharacterClass characterClass) {}
}

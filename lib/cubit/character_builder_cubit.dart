import 'package:dd5tools/models/character.dart';
import 'package:dd5tools/models/character_class.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/race.dart';

part 'character_builder_state.dart';

class CharacterBuilderCubit extends Cubit<CharacterBuilderState> {
  CharacterBuilderCubit() : super(const RaceSelection());

  Character? _character;

  Race? get race => _character?.race;

  void newCharacter() {
    _character = Character();
  }

  void init() {
    emit(const RaceSelection());
  }

  void selectRace(Race race) {
    _character!.race = race;
    emit(const DisplayRaceTraits());
  }

  void displayRaceTraits() {
    emit(const DisplayRaceTraits());
  }

  void displayClassSelectionPage() {
    emit(const ClassSelection());
  }

  void selectClass(CharacterClass characterClass) {
    _character!.characterClass = characterClass;
  }
}

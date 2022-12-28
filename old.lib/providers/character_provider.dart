import 'package:flutter/widgets.dart';

import '../models/characer.dart';
import '../utils/db_util.dart';

class CharacterProvider extends ChangeNotifier {
  CharacterProvider(DbUtil dbUtil) : _dbUtil = dbUtil;

  final DbUtil _dbUtil;

  Future<List<Character>> getCharacters() async {
    return await _dbUtil.getCharacters();
  }
}

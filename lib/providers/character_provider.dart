import 'package:dd5tools/utils/db_util.dart';
import 'package:flutter/widgets.dart';

import '../models/characer.dart';

class CharacterProvider extends ChangeNotifier {
  CharacterProvider(DbUtil dbUtil) : _dbUtil = dbUtil;

  final DbUtil _dbUtil;

  Future<List<Character>> getCharacters() async {
    return await _dbUtil.getCharacters();
  }
}

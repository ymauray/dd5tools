import 'package:sqflite/sqflite.dart';

import '../models/characer.dart';

class DbUtil {
  Database? _database;

  Future<Database> _getDatabase() async {
    var databasesPath = await getDatabasesPath();
    var path = '$databasesPath/dd5tools.db';

    //if (kDebugMode) {
    await deleteDatabase(path);
    _database = null;
    //}

    _database ??= await openDatabase(path, version: 1, onUpgrade: _upgrade);

    return _database!;
  }

  void _upgrade(Database db, int fromVersion, int toVersion) async {
    if (fromVersion == 0) {
      await db.execute('''
        CREATE TABLE characters (
          id INTEGER PRIMARY KEY,
          name TEXT,
          tagline TEXT,
          selected INTEGER
        )
      ''');

      for (var character in [
        Character(
          name: "Kräal",
          tagline: "Paladin, deux, trois, quatre, ...",
        ),
        Character(name: "Valla Morigak", tagline: "Elle est ou ? Pala(dine) !"),
        Character(
          name: "Yavana",
          tagline: "Y'a du soleil et Yavana, dar la dir la dada...",
        ),
      ]) {
        await db.insert('characters', character.toMap());
      }
    }
  }

  Future<List<Character>> getCharacters() async {
    var db = await _getDatabase();
    var charactersMap = await db.query('characters');
    var characters =
        charactersMap.map((character) => Character.fromMap(character)).toList();

    return characters;
  }
}

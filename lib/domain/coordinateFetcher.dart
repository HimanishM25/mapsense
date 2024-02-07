import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class CoordinateFetcher {
  Future<List<Map<String, dynamic>>> fetchCoordinates() async {
    final databasePath = await getDatabasesPath();
    final database = await openDatabase(
      join(databasePath, 'coordinates.db'),
      version: 1,
    );

    return await database.query('coordinates');
  }
}


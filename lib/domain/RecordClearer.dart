import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<void> clearRecords() async {
    final databasePath = await getDatabasesPath();
    final database = await openDatabase(
      join(databasePath, 'coordinates.db'),
      version: 1,
    );

    await database.delete('coordinates');
  }

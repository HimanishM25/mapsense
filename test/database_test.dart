import 'package:flutter_test/flutter_test.dart';
import 'package:mapsense/domain/coordinateFetcher.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

void main() {
  test('Test storeCoordinatesInDatabase', () async {
    // Create an instance of CoordinateFetcher
    final coordinateFetcher = CoordinateFetcher();

    // Store the coordinates in the SQLite database
    String path = join(await getDatabasesPath(), 'test_coordinates.db');
    Database coordinateDatabase = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
        'CREATE TABLE IF NOT EXISTS coordinates (id INTEGER PRIMARY KEY, latitude REAL, longitude REAL)',
      );
    });
    double latitude = 37.7749;
    double longitude = -122.4194;

    await coordinateDatabase.insert('coordinates', {'latitude': latitude, 'longitude': longitude});

    // Verify that the coordinates are stored in the database
    List<Map<String, dynamic>> storedCoordinates =
        await coordinateDatabase.query('coordinates');
    expect(storedCoordinates.length, 1);
    expect(storedCoordinates[0]['latitude'], latitude);
    expect(storedCoordinates[0]['longitude'], longitude);

    // Close the database
    await coordinateDatabase.close();
  });
}
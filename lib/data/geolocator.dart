import 'package:sqflite/sqflite.dart';
import 'package:geocoding/geocoding.dart';
import 'package:path/path.dart';

Future<String?> getCityFromCoordinates() async {
  // Store the coordinates in the SQLite database
  String path = join(await getDatabasesPath(), 'coordinates.db');
  Database coordinateDatabase = await openDatabase(path, version: 1,
      onCreate: (Database db, int version) async {
    await db.execute(
      'CREATE TABLE IF NOT EXISTS coordinates_table (id INTEGER PRIMARY KEY, latitude REAL, longitude REAL)',
    );
  });

  // Query the database to get the coordinates
  final List<Map<String, dynamic>> results = await coordinateDatabase.query('coordinates');

  // Get the latitude and longitude from the results
  final double latitude = results[0]['latitude'];
  final double longitude = results[0]['longitude'];

  // Use geocoding to get the city from the coordinates
  final List<Placemark> placemarks = await placemarkFromCoordinates(latitude, longitude);
  final String? city = placemarks[0].locality;

  // Close the database
  await coordinateDatabase.close();

  print(city);
}

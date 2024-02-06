import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

void getCoordinates(BuildContext context) async {
  Location location = Location();
  bool serviceEnabled;
  PermissionStatus permissionGranted;

  // Check if location services are enabled
  serviceEnabled = await location.serviceEnabled();
  if (!serviceEnabled) {
    serviceEnabled = await location.requestService();
    if (!serviceEnabled) {
      Fluttertoast.showToast(
        msg: "Location services are disabled",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
      return;
    }
  }

  // Check if location permission is granted
  permissionGranted = await location.hasPermission();
  if (permissionGranted == PermissionStatus.denied) {
    permissionGranted = await location.requestPermission();
    if (permissionGranted != PermissionStatus.granted) {
      Fluttertoast.showToast(
        msg: "Location permission not granted",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
      return;
    }
  }

  // Get the current location
  LocationData currentLocation = await location.getLocation();
  double? latitude = currentLocation.latitude;
  double? longitude = currentLocation.longitude;

  // Store the coordinates in the SQLite database
  String path = join(await getDatabasesPath(), 'coordinates.db');
  Database coordinateDatabase = await openDatabase(path, version: 1,
      onCreate: (Database db, int version) async {
    await db.execute(
      'CREATE TABLE IF NOT EXISTS coordinates (id INTEGER PRIMARY KEY, latitude REAL, longitude REAL)',
    );
  });
  await coordinateDatabase.insert('coordinates', {'latitude': latitude, 'longitude': longitude});

  // Show a toast with the coordinates
  Fluttertoast.showToast(
    msg: "Latitude: $latitude, Longitude: $longitude",
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
  );
}

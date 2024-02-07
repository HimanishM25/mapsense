import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class MapView extends StatefulWidget {
  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  List<Marker> _markers = [];

  @override
  void initState() {
    super.initState();
    loadMarkersFromDatabase();
  }

  Future<void> loadMarkersFromDatabase() async {
    String path = join(await getDatabasesPath(), 'coordinates.db');
    Database coordinateDatabase = await openDatabase(path, version: 1);
    List<Map<String, dynamic>> coordinates = await coordinateDatabase.query('coordinates');
    setState(() {
      _markers = coordinates.map((coordinate) {
        LatLng position = LatLng(coordinate['latitude'], coordinate['longitude']);
        return Marker(markerId: MarkerId(position.toString()), position: position);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    CameraPosition _initialPosition = CameraPosition(
      target: LatLng(37.7749, -122.4194), // Dummy initial position
      zoom: 14.0,
    );

    return Scaffold(
      body: GoogleMap(
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        initialCameraPosition: _initialPosition,
        markers: Set<Marker>.of(_markers),
      ),
    );
  }
}

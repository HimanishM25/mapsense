import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class CoordinateHistoryPage extends StatefulWidget {
  const CoordinateHistoryPage({Key? key}) : super(key: key);

  @override
  _CoordinateHistoryPageState createState() => _CoordinateHistoryPageState();
}

class _CoordinateHistoryPageState extends State<CoordinateHistoryPage> {
  List<Map<String, dynamic>> _coordinates = [];

  @override
  void initState() {
    super.initState();
    _fetchCoordinates();
  }

  Future<List<Map<String, dynamic>>> _fetchCoordinates() async {
    final databasePath = await getDatabasesPath();
    final database = await openDatabase(
      join(databasePath, 'coordinateDatabase.db'),
      version: 1,
    );

    final coordinates = await database.query('coordinates');
    setState(() {
      _coordinates = coordinates;
    });
    return coordinates;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: _coordinates.length,
        itemBuilder: (context, index) {
          final coordinate = _coordinates[index];
          return ListTile(
            title: Text('Latitude: ${coordinate['latitude']}'),
            subtitle: Text('Longitude: ${coordinate['longitude']}'),
          );
        },
      ),
    );
  }
}


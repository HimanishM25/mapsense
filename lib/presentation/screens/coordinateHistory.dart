import 'package:flutter/material.dart';
import 'package:mapsense/domain/RecordClearer.dart';
import 'package:mapsense/domain/coordinateFetcher.dart';

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
    CoordinateFetcher().fetchCoordinates().then((value) {
      setState(() {
        _coordinates = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: _coordinates.length,
        itemBuilder: (context, index) {
          final coordinate = _coordinates[index];
          return ListTile(
            title: Text('Record ${index+1}'),
            subtitle: Text('Longitude: ${coordinate['longitude']} \nLatitude: ${coordinate['latitude']}'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          clearRecords();
            setState(() {
      _coordinates = [];
    });},
        child: Icon(Icons.delete),
      ),
    );
  }
}


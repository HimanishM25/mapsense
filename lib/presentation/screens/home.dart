import 'package:flutter/material.dart';
import 'package:mapsense/data/geolocator.dart';
import 'package:mapsense/data/getCoordinates.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Add your button logic here
                      getCoordinates(context);
                      getCityFromCoordinates();
                    },
                    child: Text('Get Coordinates'),
                  ),

                ],
              ),
            );
          }
        }

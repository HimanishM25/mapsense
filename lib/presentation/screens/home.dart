import 'package:flutter/material.dart';
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
                    },
                    child: Text('Get Coordinates'),
                  ),

                ],
              ),
            );
          }
        }

import 'package:flutter/material.dart';
import 'package:mapsense/data/getCoordinates.dart';
import 'package:mapsense/domain/greeter.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          getGreeting(),
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Get coordinates of your location',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16.0),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // Add your button logic here
                        getCoordinates(context);
                      },
                      child: Text('Get Coordinates'),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Text('Coordinates get stored in the history tab.', textAlign: TextAlign.center, style: TextStyle(fontSize: 12, color: Colors.grey[600]))

                ],
              ),
            );
          }
        }

import 'package:flutter/material.dart';
import 'package:mapsense/presentation/screens/home.dart';
import 'package:mapsense/presentation/screens/coordinateHistory.dart';
import 'package:mapsense/presentation/screens/mapView.dart';
import 'package:mapsense/presentation/widgets/appbar.dart';

class NavigationPage extends StatefulWidget {
  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    const CoordinateHistoryPage(),
    MapView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: _pages[_currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.history),
            label: 'History',
          ),
          NavigationDestination(
            icon: Icon(Icons.map),
            label: 'Map View',
          ),
        ],
      ),
    );
  }
}

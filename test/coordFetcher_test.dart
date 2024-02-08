import 'package:flutter_test/flutter_test.dart';
import 'package:mapsense/domain/coordinateFetcher.dart';

void main() {
  test('Test coordinateFetcher.dart', () {
    // Create an instance of CoordinateFetcher
    final coordinateFetcher = CoordinateFetcher();

    // Test the fetchCoordinates method
    final coordinates = coordinateFetcher.fetchCoordinates();

    // Verify that the coordinates are not null
    expect(coordinates, isNotNull);

    // Verify that the coordinates have the expected format
    test('Test coordinateFetcher.dart', () async {
      final coordinateFetcher = CoordinateFetcher();

      final coordinates = await coordinateFetcher.fetchCoordinates();
      expect(coordinates[0]['latitude'], isA<double>());
      expect(coordinates[0]['longitude'], isA<double>());
    });
  });
}

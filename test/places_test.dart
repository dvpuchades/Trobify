import 'package:flutter_test/flutter_test.dart';
import 'package:trobify/domain/map/places_service.dart';

void main() {
  var service = PlacesService();

  group('Autocomplete service', () {
    test('Suggestions names', () async {
      var suggList = await service.getAutocomplete('Valencia');

      var firstResultStr = suggList.first.description;
      var secondResultStr = suggList[1].description;
      var thirdResultStr = suggList[2].description;

      expect(firstResultStr, 'Valencia, España');
      expect(secondResultStr, 'Valencia, Carabobo, Venezuela');
      expect(thirdResultStr, 'Valencia, Santa Clarita, California, EE. UU.');
    });
    test('Suggestions placeId', () async {
      var suggList = await service.getAutocomplete('Valencia');

      var firstPlaceId = suggList.first.placeId;
      var secondPlaceId = suggList[1].placeId;
      var thirdPlaceId = suggList[2].placeId;

      expect(firstPlaceId, 'ChIJb7Dv8ExPYA0ROR1_HwFRo7Q');
      expect(secondPlaceId, 'ChIJj5JhzotngI4RckLDqO7peJ8');
      expect(thirdPlaceId, 'ChIJ3VMEvDSHwoAR3kFVT3-gtxc');
    });

    test('getAutocomplete suggest 5 places', () async {
      var suggList = await service.getAutocomplete('Valencia');

      expect(suggList.length, 5);
    });

    test('No suggestions when search do not exist', () async {
      var suggList = await service.getAutocomplete('Israelakistania');

      expect(suggList.length, 0);
    });
  });

  group('getPlace service', () {
    test('get Name from placeId', () async {
      var place = await service.getPlace('ChIJb7Dv8ExPYA0ROR1_HwFRo7Q');

      expect(place.name, 'Valencia, España');
    });
    test('get LatLng from placeId', () async {
      var place = await service.getPlace('ChIJb7Dv8ExPYA0ROR1_HwFRo7Q');

      var placeLat = place.geometry.location.lat;
      var placeLng = place.geometry.location.lng;

      expect(placeLat, 39.4699075);
      expect(placeLng, -0.3762881);
    });
  });

  group('getPlaces services (Near Places)', () {
    test('Near places list not empty', () async {
      var results = await service.getPlaces(39.4699075, -0.3762881, 'museum');

      expect(results.isNotEmpty, true);
    });

    test('First near place', () async {
      var results = await service.getPlaces(39.478179, -0.379535, 'museum');

      var firstNearPlaceStr = results.first.name;

      expect(firstNearPlaceStr, 'Centro Cultural La Beneficència, Carrer de la Corona, 36, 46003 Valencia');
    });
  });
}

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:trobify/domain/map/place.dart';
import 'package:trobify/domain/map/place_search.dart';

class PlacesService {
  final key = 'AIzaSyABii14ntN14cMqwC1YQwoVcDnO0sy-m8M';

  Future<List<PlaceSearch>> getAutocomplete(String search) async {
    var url =
        Uri.parse('https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$search&key=$key&language=es');
    var response = await http.get(url);
    var json = convert.jsonDecode(response.body);
    var jsonResults = json['predictions'] as List;
    return jsonResults.map((place) => PlaceSearch.fromJson(place)).toList();
  }

  Future<Place> getPlace(String placeId) async {
    var url =
        Uri.parse('https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$key&language=es');
    var response = await http.get(url);
    var json = convert.jsonDecode(response.body);
    var jsonResult = json['result'] as Map<String, dynamic>;
    return Place.fromJson(jsonResult);
  }

  Future<List<Place>> getPlaces(double lat, double lng, String placeType) async {
    var url = Uri.parse(
        'https://maps.googleapis.com/maps/api/place/textsearch/json?location=$lat,$lng&type=$placeType&rankby=prominence&key=$key&language=es');
    var response = await http.get(url);
    var json = convert.jsonDecode(response.body);
    var jsonResults = json['results'] as List;
    return jsonResults.map((place) => Place.fromJson(place)).toList();
  }
}

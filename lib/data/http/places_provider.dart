import 'dart:convert';

import 'package:primecustomer/res/config/app_config.dart';
import 'package:http/http.dart';

import '../model/remote/suggestion.dart';

class PlaceApiProvider {
  final client = Client();
  final String sessionToken;
  final apiKey = AppConfig.googleAPIKey;

  PlaceApiProvider(this.sessionToken);



  Future<List<Suggestion>> fetchSuggestions(String input, String lang) async {
    final request =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$input&components=country:gh&key=$apiKey&sessiontoken=$sessionToken';
    var uri = Uri.parse(request);
    print("REQUEST $uri");
    final response = await client.get(uri);

    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      print("RESPONSE SEARCH $result");

      if (result['status'] == 'OK') {
        // compose suggestions in a list
        return result['predictions']
            .map<Suggestion>((p) => Suggestion(
                placeId: p['place_id'], description: p['description']))
            .toList();
      }
      if (result['status'] == 'ZERO_RESULTS') {
        return [];
      }
      throw Exception(result['error_message']);
    } else {
      throw Exception('Failed to fetch suggestion');
    }
  }

  Future<Suggestion> getPlaceDetailFromId(Suggestion suggestion) async {
    String placeId = suggestion.placeId;
    final request =
        'https://maps.googleapis.com/maps/api/geocode/json?place_id=$placeId&fields=address_component&key=$apiKey&sessiontoken=$sessionToken';
    var uri = Uri.parse(request);
    print("REQUEST $uri");
    final response = await client.get(uri);

    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      print("RESPONSE PLACE SEARCH $result");

      if (result['status'] == 'OK') {
        final results = result['results'][0];

        print("RED $results");

        final place = Suggestion(
          address: suggestion.description,
          longitude: getLatLng(results, "lng"),
          latitude: getLatLng(results, "lat"),
          description: getObject("formatted_address", results),
          placeId: suggestion.placeId,
        );
        return place;
      }
      throw Exception(result['error_message']);
    } else {
      throw Exception('Failed to fetch suggestion');
    }
  }

  dynamic getObject(String key, Map<String, dynamic> json) {
    return json.containsKey(key) ? json[key] : "";
  }

  double getLatLng(Map<String, dynamic> json, String key) {
    print("RES $json");
    var geometry = json.containsKey("geometry") ? json["geometry"] : null;
    if (geometry != null) {
      var location = geometry["location"];
      if (location != null) {
        return getObject(key, location);
      }
    }
    return 0.0;
  }
}

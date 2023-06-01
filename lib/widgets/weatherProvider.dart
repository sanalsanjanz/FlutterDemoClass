import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class WeatherProvider extends ChangeNotifier {
  var apiKey = '5f851c929515c5de7e6e8c6fa685e05b';
  double lat = 0.00;
  double log = 0.00;
  Future getCurrentWeather() async {
    var baseUrl =
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$log&appid=$apiKey';
    http.Response response = await http.get(Uri.parse(baseUrl));
    print(response.body);
    var data = jsonDecode(response.body);
    return data;
  }

  int counter = 0;
  increment() {
    counter++;
    notifyListeners();
  }

  Future determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    var location = await Geolocator.getCurrentPosition();

    lat = location.latitude;
    log = location.longitude;

    getCurrentWeather();
    notifyListeners();
  }
}

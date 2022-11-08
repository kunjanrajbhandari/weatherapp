import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:weatherapp/model/weather_details_model.dart';

class CurrentWeather extends GetxController {
  bool loading = false;
  RxList<WeatherValues> getWeathersList = <WeatherValues>[].obs;

  double? lats;
  double? longs;

  getweatherapi() async {
    getWeathersList.clear();
    loading = true;
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    lats = position.latitude;
    longs = position.longitude;
    var url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$lats&lon=$longs&appid=1661225d88d12792242874cf90f1ae17');
    loading = false;
    var response = await http.get(url);
    dynamic result = json.decode(response.body);
    if (response.statusCode == 200) {
      getWeathersList.add(WeatherValues(
          cityName: result['name'],
          description: result['weather'][0]['description'],
          humidity: result['main']['humidity'],
          icon: result['weather'][0]['icon'],
          temperature: result['main']['temp'],
          windSpeed: result['wind']['speed'],
          lat: result['coord']['lat'],
          long: result['coord']['lon'],
          countryName: result['sys']['country']));
    }
  }
}

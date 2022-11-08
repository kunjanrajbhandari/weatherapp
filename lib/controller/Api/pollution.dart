import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:weatherapp/model/pollution_model.dart';

class CurrentPollutionApi extends GetxController {
  RxList<PollutionModel> getPollutionList = <PollutionModel>[].obs;
  bool loading = false;

  double? lats;
  double? longs;

  getPollutionApi() async {
    getPollutionList.clear();
    loading = true;
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    lats = position.latitude;
    longs = position.longitude;
    var url = Uri.parse(
        'http://api.openweathermap.org/data/2.5/air_pollution?lat=$lats&lon=$longs&appid=1661225d88d12792242874cf90f1ae17');

    var response = await http.get(url);
    dynamic result = json.decode(response.body);
    loading = false;
    if (response.statusCode == 200) {
      getPollutionList.add(PollutionModel(
        lat: result['coord']['lat'],
        lon: result['coord']['lon'],
        airQualityIndex: result['list'][0]['main']['aqi'],
        no2: result['list'][0]['components']['no2'],
        o3: result['list'][0]['components']['o3'],
        pm10: result['list'][0]['components']['pm10'],
      ));
    }
  }
}

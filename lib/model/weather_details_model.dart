import 'package:get/get.dart';

class WeatherValues extends GetxController{
  double? lat;
  double? long;
  
  double? temperature;
  int? humidity;
  double? windSpeed;

  String? description;
  String? icon;
  String? cityName;
  String? countryName;


  WeatherValues({
    required this.lat, required this.long, 
    required this.temperature, required this.humidity, 
    required this.windSpeed,required this.cityName,
    required this.description, required this.icon,required this.countryName
   });
}


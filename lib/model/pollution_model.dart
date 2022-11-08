class PollutionModel {
  double? lat;
  double? lon;

  int? airQualityIndex;
  double? no2;
  dynamic pm10;
  double o3 = 0;

  PollutionModel(
      {required this.lat,
      required this.lon,
      required this.airQualityIndex,
      required this.no2,
      required this.o3,
      required this.pm10});
}

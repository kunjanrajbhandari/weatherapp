import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp/controller/Api/pollution.dart';
import 'package:weatherapp/controller/Api/weather.dart';
import 'package:weatherapp/view/app_main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  CurrentWeather currentweather = Get.put(CurrentWeather());
  CurrentPollutionApi pollutionApi = Get.put(CurrentPollutionApi());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    data();
  }

  data() async {
    await currentweather.getweatherapi();
    await pollutionApi.getPollutionApi();
    if (currentweather.loading == false && pollutionApi.loading == false) {
      Get.to(const CasePractice());
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp/controller/Api/weather.dart';
import 'package:weatherapp/view/amazon_url.dart';
import 'package:weatherapp/view/weather_app_main.dart';
import 'package:weatherapp/view/web_view.dart';
import 'package:weatherapp/view/web_view_contact.dart';

class CasePractice extends StatefulWidget {
  const CasePractice({Key? key}) : super(key: key);

  @override
  _CasePracticeState createState() => _CasePracticeState();
}

class _CasePracticeState extends State<CasePractice> {
  CurrentWeather currentweather = Get.put(CurrentWeather());

  Rx<int> currentPosition = 0.obs;
  final tab = [
    const WeatherWidget(),
    WebViewExample(),
    WebviewBlog(),
    WebviewContact(),
  ].obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.9),
      body: Obx(() => tab[currentPosition.value]),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          backgroundColor: Colors.black,
          unselectedItemColor: Colors.white,
          currentIndex: currentPosition.value,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.railway_alert),
              label: 'Weather',
              backgroundColor: Colors.black,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.poll_outlined),
              label: 'Shop',
              backgroundColor: Colors.black,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.poll_outlined),
              label: 'Blog',
              backgroundColor: Colors.black,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.poll_outlined),
              label: 'Contact',
              backgroundColor: Colors.black,
            ),
          ],
          onTap: (index) {
            currentPosition.value = index;
          },
        ),
      ),
    );
  }
}

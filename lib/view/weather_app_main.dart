import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp/constant/constant.dart';
import 'package:weatherapp/controller/Api/pollution.dart';
import 'package:weatherapp/controller/Api/weather.dart';
import 'package:weatherapp/view/widget/appBar.dart';

class WeatherWidget extends StatefulWidget {
  const WeatherWidget({Key? key}) : super(key: key);

  @override
  _WeatherWidgetState createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget> {
  CurrentWeather currentweather = Get.put(CurrentWeather());
  CurrentPollutionApi pollutionApi = Get.put(CurrentPollutionApi());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.black,

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: ScrollPhysics(),
        child: Column(
          children: [
            CAppBar(
              values: currentweather.getWeathersList,
              pollution: pollutionApi.getPollutionList,
            ),
            SizedBox(
              height: 33,
            ),
            //AQI Index ,good, fair, moderate, poor, very poor
            // SingleChildScrollView(
            //   // scrollDirection: Axis.horizontal,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     children: [
            //       Container(
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(19),
            //           color: Colors.green,
            //         ),
            //         child: const Padding(
            //           padding: EdgeInsets.all(8),
            //           child: Text(
            //             "Good",
            //             style: TextStyle(fontWeight: FontWeight.bold),
            //           ),
            //         ),
            //       ),
            //       Container(
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(19),
            //           color: Colors.greenAccent,
            //         ),
            //         child: Padding(
            //           padding: EdgeInsets.all(8),
            //           child: Text(
            //             "Fair",
            //             style: TextStyle(fontWeight: FontWeight.bold),
            //           ),
            //         ),
            //       ),
            //       Container(
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(19),
            //           color: Colors.yellow,
            //         ),
            //         child: Padding(
            //           padding: EdgeInsets.all(8),
            //           child: Text(
            //             "Moderate",
            //             style: TextStyle(fontWeight: FontWeight.bold),
            //           ),
            //         ),
            //       ),
            //       Container(
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(19),
            //           color: Colors.orange,
            //         ),
            //         child: Padding(
            //           padding: EdgeInsets.all(8),
            //           child: Text(
            //             "Poor",
            //             style: TextStyle(fontWeight: FontWeight.bold),
            //           ),
            //         ),
            //       ),
            //       Container(
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(19),
            //           color: Colors.red,
            //         ),
            //         child: Padding(
            //           padding: EdgeInsets.all(8),
            //           child: Text(
            //             "Very Poor",
            //             style: TextStyle(fontWeight: FontWeight.bold),
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),

            SizedBox(
              height: 222,
              child: CarouselSlider(
                options: CarouselOptions(
                    height: 400.0,
                    viewportFraction: 0.95,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 2)),
                items: imageList.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(color: Colors.amber),
                          child: Image(
                            image: NetworkImage(i),
                            fit: BoxFit.cover,
                          ));
                    },
                  );
                }).toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 28.0),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      color: Color.fromARGB(255, 200, 223, 255),
                      border: Border.all(color: Colors.grey)),
                  width: MediaQuery.of(context).size.width - 22,
                  height: MediaQuery.of(context).size.height / 1.2,
                  child: ListView.builder(
                      itemCount: currentweather.getWeathersList.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        int temp = (currentweather
                                    .getWeathersList[index].temperature! -
                                273)
                            .toInt();

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 66.0),
                            ),
                            Stack(
                              alignment: AlignmentDirectional.topCenter,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    //Padding(padding: EdgeInsets.only(top: 33.0)),
                                    Image(
                                        height: 99,
                                        image: AssetImage(
                                          'assets/icons/${currentweather.getWeathersList[index].icon}.png',
                                        )),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 28.0),
                                      child: Text(
                                        '${currentweather.getWeathersList[index].description}',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20.0),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 28.0),
                                      child: Text(
                                        '$temp°',
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 75.0),
                                      ),
                                    ),
                                    Stack(
                                      alignment: AlignmentDirectional.topCenter,
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(top: 25.0),
                                          child: Image(
                                              height: 80.0,
                                              image: AssetImage(
                                                  'assets/icons/weather2.png')),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 55.0),
                                          child: Container(
                                            height: 222.0,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                22,
                                            decoration: BoxDecoration(
                                              color:
                                                  Colors.black.withOpacity(0.1),
                                              borderRadius:
                                                  BorderRadius.circular(11.0),
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    RichText(
                                                        text: TextSpan(
                                                            text: 'Wind\n\n',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black
                                                                    .withOpacity(
                                                                        0.7),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 22.0),
                                                            children: [
                                                          TextSpan(
                                                            text:
                                                                '${currentweather.getWeathersList[index].windSpeed} m/s',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 15.0),
                                                          ),
                                                        ])),
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 11.0)),
                                                    RichText(
                                                        text: TextSpan(
                                                            text:
                                                                'Humidity\n\n',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black
                                                                    .withOpacity(
                                                                        0.7),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 22.0),
                                                            children: [
                                                          TextSpan(
                                                            text:
                                                                '${currentweather.getWeathersList[index].humidity}%',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 15.0),
                                                          ),
                                                        ])),
                                                  ],
                                                ),
                                                //Padding(padding: EdgeInsets.only(top: 18.0)),
                                                Divider(
                                                    height: 33.0,
                                                    color: Colors.grey,
                                                    thickness: 2,
                                                    indent: 20,
                                                    endIndent: 20),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    RichText(
                                                        text: TextSpan(
                                                            text:
                                                                'Latitude\n\n',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black
                                                                    .withOpacity(
                                                                        0.7),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 22.0),
                                                            children: [
                                                          TextSpan(
                                                            text:
                                                                '${currentweather.getWeathersList[index].lat}',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 15.0),
                                                          ),
                                                        ])),
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 11.0)),
                                                    RichText(
                                                        text: TextSpan(
                                                            text:
                                                                'Longitude\n\n',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black
                                                                    .withOpacity(
                                                                        0.7),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 22.0),
                                                            children: [
                                                          TextSpan(
                                                            text:
                                                                '${currentweather.getWeathersList[index].long}',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 15.0),
                                                          ),
                                                        ])),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ],
                        );
                      }),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

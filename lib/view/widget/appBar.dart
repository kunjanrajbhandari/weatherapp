import 'package:flutter/material.dart';
import 'package:weatherapp/controller/aqi_index_level.dart';
import 'package:weatherapp/model/weather_details_model.dart';

import '../../model/pollution_model.dart';

class CAppBar extends StatelessWidget implements PreferredSizeWidget {
  List<WeatherValues>? values;
  List<PollutionModel>? pollution;
  CAppBar({Key? key, this.values, this.pollution}) : super(key: key);
  @override
  Size get preferredSize => const Size.fromHeight(205.0);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 188,
        width: MediaQuery.of(context).size.width,
        color: Colors.orange,
        // decoration:
        //     const BoxDecoration(shape: BoxShape.circle, color: Colors.red),
        child: Center(
          child: Container(
            height: 166,
            width: MediaQuery.of(context).size.width - 33,
            color: Color(0xffE5E5E5),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 44,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image(
                          image: AssetImage("assets/icons/logo.png"),
                          height: 44,
                        ),
                        Container(
                          height: 33,
                          width: MediaQuery.of(context).size.width / 2,
                          decoration: BoxDecoration(
                              border: Border.all(width: 0.5),
                              borderRadius: BorderRadius.circular(12)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Enter your location...",
                                style: TextStyle(color: Colors.grey),
                              ),
                              Icon(Icons.search)
                            ],
                          ),
                        ),
                        Icon(Icons.notifications)
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        // height: 77,
                        width: MediaQuery.of(context).size.width / 2.2,
                        child: ListView.builder(
                            itemCount: values!.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.location_pin,
                                        color: Colors.black,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 11.0),
                                        child: RichText(
                                            text: TextSpan(
                                                text:
                                                    '${values![index].cityName}, ',
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 17.0),
                                                children: [
                                              TextSpan(
                                                text:
                                                    '${values![index].countryName}',
                                                style: TextStyle(
                                                    color: Colors.black
                                                        .withOpacity(0.5),
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 15.0),
                                              ),
                                            ])),
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            }),
                      ),
                      Container(
                        // color: Colors.red,
                        height: 77,
                        width: MediaQuery.of(context).size.width / 4,
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: pollution!.length,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              return Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Text("AQI"),
                                      Text(
                                          "${pollution![index].airQualityIndex}"),
                                    ],
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: AqiIndexLevel().getColorLevel(
                                            pollution![index]
                                                .airQualityIndex!
                                                .toInt()),
                                        // shape: BoxShape.circle,
                                        borderRadius:
                                            BorderRadius.circular(22)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        AqiIndexLevel().getIndexLevel(
                                            pollution![index]
                                                .airQualityIndex!
                                                .toInt()),
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  )
                                ],
                              );
                            }),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

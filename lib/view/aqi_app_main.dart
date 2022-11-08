import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:weatherapp/controller/Api/pollution.dart';
import 'package:weatherapp/controller/aqi_index_level.dart';
import 'package:weatherapp/view/widget/pollution_widget.dart';

class PollutionMain extends StatefulWidget {
  const PollutionMain({Key? key}) : super(key: key);

  @override
  _PollutionMainState createState() => _PollutionMainState();
}

class _PollutionMainState extends State<PollutionMain> {
  CurrentPollutionApi pollutionApi = Get.put(CurrentPollutionApi());
  @override
  void initState() {
    super.initState();
    pollutionApi.getPollutionApi();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: pollutionApi.getPollutionList.length,
        itemBuilder: (context, index) {
          var val = pollutionApi.getPollutionList[index].airQualityIndex;
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Stack(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 0),
                  child: Opacity(
                    opacity: 0.1,
                    child: Image(
                      image: AssetImage('assets/icons/pollution.jpeg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PollutionWidget(
                      aqi: pollutionApi.getPollutionList[index].airQualityIndex,
                    ),
                    Padding(padding: EdgeInsets.only(top: 144.0)),
                    Text(
                      '${AqiIndexLevel().getIndexLevel(val!)}',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          );
        }));
  }
}

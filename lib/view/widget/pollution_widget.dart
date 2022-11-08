import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class PollutionWidget extends StatefulWidget {
  int? aqi;
   PollutionWidget({Key? key, required this.aqi}) : super(key: key) ;

  @override
  _PollutionWidgetState createState() => _PollutionWidgetState();
}

class _PollutionWidgetState extends State<PollutionWidget> {
  @override
  
  Widget build(BuildContext context) {
    return  SizedBox(
        height: 350.0,
        width: MediaQuery.of(context).size.width,
        child: SfRadialGauge(
          axes: [
            RadialAxis(
              minimum: 0.5,
              maximum: 5.5,
              
              interval: 2,
              showLabels: false,
              ranges: [
                GaugeRange(startValue: 0.5, endValue: 1.5, color: Colors.green,),
                GaugeRange(startValue: 1.5, endValue: 2.5, color: Colors.greenAccent,),
                GaugeRange(startValue: 2.5, endValue: 3.5, color: Colors.yellow,),
                GaugeRange(startValue: 3.5, endValue: 4.5, color: Colors.orange,),
                GaugeRange(startValue: 4.5, endValue: 5.5, color: Colors.red,)
              ],
              pointers: [
                NeedlePointer(
                  value:widget.aqi!+.0,
                  enableAnimation: true,
                )
              ],
              annotations: [
                GaugeAnnotation(
                  widget: Padding(
                    padding: const EdgeInsets.only(top:188.0),
                    child: RichText(
                        text: TextSpan(
                          text: 'Air Quality Index\n\n',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.7), fontWeight: FontWeight.bold, fontSize: 15.0),
                            children: [
                                TextSpan(
                                  text: '  ${widget.aqi}', 
                                  style: 
                                  (widget.aqi == 1)?TextStyle(color: Colors.green , fontWeight: FontWeight.w400, fontSize: 88.0):
                                  (widget.aqi == 2)?TextStyle(color: Colors.greenAccent , fontWeight: FontWeight.w400, fontSize: 88.0):
                                  (widget.aqi == 3)?TextStyle(color: Colors.yellow , fontWeight: FontWeight.w400, fontSize: 88.0):
                                  (widget.aqi == 4)?TextStyle(color: Colors.orange , fontWeight: FontWeight.w400, fontSize: 88.0):
                                  TextStyle(color: Colors.red , fontWeight: FontWeight.w400, fontSize: 88.0)
                                ),
                            ]
                          )
                        ),
                  ),
                  positionFactor: 0.5,
                  angle: 90,
                  )
              ],
            ),
          ],
        ),
     
    );
  }
}
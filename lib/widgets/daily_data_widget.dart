import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp_starter_project/model/weather_data_daily.dart';
import 'package:weatherapp_starter_project/utils/custom_color.dart';


class DailyDataWidget extends StatelessWidget {
  final WeatherDataDaily weatherDataDaily;
  const DailyDataWidget({
    Key? key, required this.weatherDataDaily})
      : super(key: key);


  //string manipulation
  String getDay(final day){
    DateTime time = DateTime.fromMillisecondsSinceEpoch(day * 1000);
    final x = DateFormat('EEE').format(time);
    return x;
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      margin: const EdgeInsets.all(20),
      padding:const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: CustomColors.dividerLine.withAlpha(150),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(bottom: 10),
            child: const Text(
              "Next Week",
              style: TextStyle(
                  color: CustomColors.textColorBlack,
                  fontSize: 19,fontWeight: FontWeight.w600),
            ),
          ),
          dailyList(),
        ],
      ),
    );
  }

  Widget dailyList(){
    return SizedBox(
      height: 300,
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: weatherDataDaily.daily.length > 7
              ? 7
              : weatherDataDaily.daily.length,
            itemBuilder: (context, index){
            return Column(
              children: <Widget>[
                Container(
                  height: 60,
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      SizedBox(
                        width: 80,
                        child: Text(
                            getDay(weatherDataDaily.daily[index].dt),
                          style: const TextStyle(
                            color: CustomColors.textColorBlack,
                              fontSize:  17,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,width: 30,
                        child: Image.asset("assets/weather/${weatherDataDaily.daily[index].weather![0].icon}.png"),
                      ),
                      Text("${weatherDataDaily.daily[index].temp!.min}°/${weatherDataDaily.daily[index].temp!.max}°",
                        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 1,
                  color: CustomColors.dividerLine,
                ),
              ],
            );
            },
        ),
    );
  }
}

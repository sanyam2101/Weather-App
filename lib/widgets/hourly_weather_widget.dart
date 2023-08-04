import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp_starter_project/controller/global_controller.dart';
import 'package:weatherapp_starter_project/model/weather_data_hourly.dart';
import 'package:weatherapp_starter_project/utils/custom_color.dart';

class HourlyDataWidget extends StatelessWidget {
  final WeatherDataHourly weatherDataHourly;
  HourlyDataWidget({
    Key? key, required this.weatherDataHourly})
      : super(key: key);

  //card index
  RxInt cardIndex = GlobalController().getIndex();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 20),
          alignment: Alignment.topCenter,
          child: const Text("Today",style: TextStyle(fontSize: 19,fontWeight: FontWeight.w600),),
        ),
        hourlyList(),
      ],
    );
  }


  Widget hourlyList(){
    return Container(
      height: 160,
      padding: EdgeInsets.only(top: 10,bottom: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(5),
        itemCount: weatherDataHourly.hourly.length > 24
            ? 24
            : weatherDataHourly.hourly.length,
          itemBuilder: (context, index){
          return Obx((()=> GestureDetector(
            onTap: () {
              cardIndex.value = index;
              },
              child: Container(
                width: 80,
                margin: EdgeInsets.only(left: 20,right: 5),
                decoration: BoxDecoration(
                  gradient: cardIndex.value == index ? const LinearGradient(
                      colors: [
                        CustomColors.firstGradientColor,
                        CustomColors.secondGradientColor]
                  ) : null ,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [BoxShadow(
                    offset: const Offset(0.5,0),
                    blurRadius: 30,
                    spreadRadius: 1,
                    color: CustomColors.dividerLine.withAlpha(150)
                  ),],
                ),
                child: HourlyDetails(
                  temp: weatherDataHourly.hourly[index].temp!,
                  timeStamp: weatherDataHourly.hourly[index].dt!,
                  weatherIcon: weatherDataHourly.hourly[index].weather![0].icon!,
                  index: index,
                  cardIndex: cardIndex.toInt(),
                ),
              )
          )));
          }),
    );
  }
}



//hourly details class
class HourlyDetails extends StatelessWidget {
  int temp;
  int index;
  int cardIndex;
  int timeStamp;
  String weatherIcon;

  HourlyDetails({
    Key? key,
    required this.timeStamp,
    required this.cardIndex,
    required this.index,
    required this.temp,
    required this.weatherIcon})
      : super(key: key);

  String getTime(final timeStamp){
    DateTime time= DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
    String x = DateFormat('jm').format(time);
    return x;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: Text(
            getTime(timeStamp),
            style: TextStyle(
              color: cardIndex == index
                ? Colors.white
                : CustomColors.textColorBlack,
              fontWeight: cardIndex == index
                  ? FontWeight.w600
                  : FontWeight.normal,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(5),
          child: Image.asset(
            "assets/weather/$weatherIcon.png",
            height: 40,
            width: 40,),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: Text(
            "$temp°",
            style: TextStyle(
              color: cardIndex == index
                  ? Colors.white
                  : CustomColors.textColorBlack,
              fontWeight: cardIndex == index
                  ? FontWeight.w600
                  : FontWeight.normal,
            ),
          ),
        )
      ],
    );
  }
}


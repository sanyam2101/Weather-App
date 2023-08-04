import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:weatherapp_starter_project/model/weather_data_current.dart';
import 'package:weatherapp_starter_project/utils/custom_color.dart';

class ComfortLevel extends StatelessWidget {
  final WeatherDataCurrent weatherDataCurrent;
  const ComfortLevel({
    Key? key, required this.weatherDataCurrent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(left: 20,right: 20,bottom: 20,top: 1),
          child: const Text(
            "Comfort Level",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500
            ),
          ),
        ),
        SizedBox(height: 180,
          child: Column(
            children: <Widget>[
              Center(
                child: SleekCircularSlider(
                  min: 0,
                  max: 100,
                  initialValue: weatherDataCurrent.current.humidity!.toDouble(),
                  appearance: CircularSliderAppearance(
                    customWidths: CustomSliderWidths(
                      handlerSize: 0, trackWidth: 12,progressBarWidth: 12
                    ),
                    infoProperties: InfoProperties(
                      bottomLabelText: "Humidity",
                      bottomLabelStyle: const TextStyle(letterSpacing: 0.1,fontSize: 14, height: 1.5)
                    ),
                    animationEnabled: true,
                    customColors: CustomSliderColors(
                      trackColor: CustomColors.firstGradientColor.withAlpha(100),
                      hideShadow: true,
                      progressBarColors: [CustomColors.firstGradientColor, CustomColors.secondGradientColor]
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RichText(text: TextSpan(
                    children: [
                      const TextSpan(
                        text: "Feels Like ",
                        style: TextStyle(
                            fontSize: 15,
                            height: 0.8,
                            color: CustomColors.textColorBlack,
                            fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: "${weatherDataCurrent.current.feelsLike}°",
                        style: const TextStyle(
                            fontSize: 15,
                            height: 0.8,
                            color: CustomColors.textColorBlack,
                            fontWeight: FontWeight.w400
                        ),
                      )
                    ]
                  )),
                  Container(
                    margin: const EdgeInsets.only(left: 40, right: 40),
                    height: 25,
                      width: 1,
                    color: CustomColors.dividerLine,
                  ),
                  RichText(text: TextSpan(
                      children: [
                        const TextSpan(
                          text: "UV Index ",
                          style: TextStyle(
                              fontSize: 15,
                              height: 0.8,
                              color: CustomColors.textColorBlack,
                              fontWeight: FontWeight.w400
                          ),
                        ),
                        TextSpan(
                          text: "${weatherDataCurrent.current.uvi}",
                          style: const TextStyle(
                              fontSize: 15,
                              height: 0.8,
                              color: CustomColors.textColorBlack,
                              fontWeight: FontWeight.w400
                          ),
                        )
                      ]
                  )),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/utils/determine_background.dart';
import 'package:weather_app/widgets/one_day_weather_tile.dart';

class NextDaysWeatherScreen extends StatelessWidget {
  final Weather weather;
  final List<Weather> next5DaysWeather;
  const NextDaysWeatherScreen({super.key, required this.weather, required this.next5DaysWeather});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: const Alignment(0, 1 / 3),
          colors: determineColor(weather.weatherConditionCode),
          stops: const [0.1, 0.9],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height * 0.1,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              weather.areaName.toString(),
              style: const TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
            ),
          ),
          leading: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 24,
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                const Text(
                  'Upcoming 5 days',
                  style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OneDayWeatherTile(
                      weather: next5DaysWeather[0],
                      todayWeather: weather,
                    ),
                    OneDayWeatherTile(
                      weather: next5DaysWeather[1],
                      todayWeather: weather,
                    ),
                    OneDayWeatherTile(
                      weather: next5DaysWeather[2],
                      todayWeather: weather,
                    ),
                    OneDayWeatherTile(
                      weather: next5DaysWeather[3],
                      todayWeather: weather,
                    ),
                    OneDayWeatherTile(
                      weather: next5DaysWeather[4],
                      todayWeather: weather,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

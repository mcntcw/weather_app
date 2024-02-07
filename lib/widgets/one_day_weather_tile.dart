import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/utils/determine_weather_symbol.dart';

class OneDayWeatherTile extends StatelessWidget {
  final Weather weather;
  final Weather todayWeather;
  const OneDayWeatherTile({super.key, required this.weather, required this.todayWeather});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          DateFormat('dd.MM').format(weather.date!),
          style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
          DateFormat('EEEE').format(weather.date!),
          style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.all(2),
          width: MediaQuery.of(context).size.width * 0.17,
          height: MediaQuery.of(context).size.height * 0.5,
          decoration: const BoxDecoration(
            color: Colors.white30,
            borderRadius: BorderRadius.all(
              Radius.circular(60),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              determineWeatherSymbol(weather.weatherConditionCode, 10),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  weather.weatherMain.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                '${weather.temperature!.celsius!.toStringAsFixed(0)}\u00B0',
                style: const TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
              ),
              Column(
                children: [
                  Image.asset(
                    'assets/images/ui/wind.png',
                    height: 30,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 3),
                  Text(
                    '${weather.windSpeed!.toStringAsFixed(1)} km/h',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 9,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Image.asset(
                    'assets/images/ui/cloudiness.png',
                    height: 30,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 3),
                  Text(
                    '${weather.cloudiness!.toStringAsFixed(0)} %',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 9,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Image.asset(
                    'assets/images/ui/humidity.png',
                    height: 30,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 3),
                  Text(
                    '${weather.humidity!.toStringAsFixed(0)} %',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 9,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 14),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

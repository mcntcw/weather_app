import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart' as getx;
import 'package:intl/intl.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/screens/next_days_weather_screen.dart';
import 'package:weather_app/screens/splash_screen.dart';
import 'package:weather_app/utils/determine_background.dart';
import 'package:weather_app/utils/determine_weather_symbol.dart';
import 'package:weather_app/weather_bloc/weather_bloc.dart';
import 'package:weather_app/widgets/conditions_indicator.dart';

class WeatherScreen extends StatelessWidget {
  final Position position;
  const WeatherScreen({super.key, required this.position});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        if (state is WeatherLoaded) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: const Alignment(0, 1 / 3),
                colors: determineColor(state.weather.weatherConditionCode),
                stops: const [0.1, 0.9],
              ),
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    locationText(state.weather),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.26,
                        child: determineWeatherSymbol(
                          state.weather.weatherConditionCode,
                          1,
                        )),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    currentWeatherText(state.weather),
                    largeTemperatureText(state.weather),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    weatherIndicators(context, state.weather),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    GestureDetector(
                      onTap: () {
                        getx.Get.to(
                          () => NextDaysWeatherScreen(
                            weather: state.weather,
                            next5DaysWeather: state.nextDaysWeather,
                          ),
                          transition: getx.Transition.cupertino,
                        );
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Upcoming days',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 24,
                            ),
                          ),
                          SizedBox(width: 5),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white70,
                            size: 22,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        } else {
          return const SplashScreen();
        }
      },
    );
  }

  Padding currentWeatherText(Weather weather) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          weather.weatherDescription![0].toUpperCase() + weather.weatherDescription!.substring(1),
          style: const TextStyle(color: Colors.white70, fontSize: 45, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

Column weatherIndicators(BuildContext context, Weather weather) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ContditionsIndicator(
            imageUrl: 'assets/images/ui/high.png',
            description: 'Max temp.',
            textValue: '${weather.tempMax!.celsius!.toStringAsFixed(0)}\u00B0',
          ),
          ContditionsIndicator(
            imageUrl: 'assets/images/ui/low.png',
            description: 'Min temp.',
            textValue: '${weather.tempMin!.celsius!.toStringAsFixed(0)}\u00B0',
          ),
        ],
      ),
      SizedBox(height: MediaQuery.of(context).size.height * 0.02),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ContditionsIndicator(
            imageUrl: 'assets/images/ui/sunset.png',
            description: 'Sunset',
            textValue: '${DateFormat('HH:mm').format(weather.sunset!)} pm',
          ),
          ContditionsIndicator(
            imageUrl: 'assets/images/ui/moonset.png',
            description: 'Sunrise',
            textValue: '${DateFormat('HH:mm').format(weather.sunrise!)} am',
          ),
        ],
      ),
      SizedBox(height: MediaQuery.of(context).size.height * 0.02),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ContditionsIndicator(
              imageUrl: 'assets/images/ui/wind.png',
              description: 'Wind',
              textValue: '${weather.windSpeed!.toStringAsFixed(1)} km/h'),
          ContditionsIndicator(
            imageUrl: 'assets/images/ui/cloudiness.png',
            description: 'Cloudiness',
            textValue: '${weather.cloudiness!.toStringAsFixed(0)} %',
          ),
        ],
      ),
    ],
  );
}

Text largeTemperatureText(Weather weather) {
  return Text(
    '${weather.temperature!.celsius!.toStringAsFixed(0)}\u00B0',
    style: const TextStyle(color: Colors.white70, fontSize: 100, fontWeight: FontWeight.bold),
  );
}

Widget locationText(Weather weather) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: FittedBox(
      fit: BoxFit.scaleDown,
      child: Text(
        weather.areaName.toString(),
        style: const TextStyle(color: Colors.white60, fontSize: 60, fontWeight: FontWeight.bold),
      ),
    ),
  );
}

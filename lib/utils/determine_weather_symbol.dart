import 'package:flutter/material.dart';

Widget determineWeatherSymbol(dynamic weatherCode, double scale) {
  switch (weatherCode) {
    case >= 200 && < 300:
      return Image.asset('assets/images/weather/thunderstorm.png', scale: scale);
    case >= 300 && < 400:
      return Image.asset('assets/images/weather/drizzle.png', scale: scale);
    case >= 500 && < 600:
      return Image.asset('assets/images/weather/rain.png', scale: scale);
    case >= 600 && < 700:
      return Image.asset('assets/images/weather/snow.png', scale: scale);
    case >= 700 && < 800:
      return Image.asset('assets/images/weather/atmosphere.png', scale: scale);
    case == 800:
      return Image.asset('assets/images/weather/clear.png', scale: scale);
    case >= 801 && < 900:
      return Image.asset('assets/images/weather/clouds.png', scale: scale);
    default:
      return Container();
  }
}

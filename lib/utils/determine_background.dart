import 'package:flutter/material.dart';
import 'package:weather_app/utils/colors.dart';

List<Color> determineColor(dynamic weatherCode) {
  switch (weatherCode) {
    case >= 200 && < 300:
      return [
        thunderstormLight,
        thunderstormDark,
      ];
    case >= 300 && < 400:
      return [
        drizzleLight,
        drizzleDark,
      ];
    case >= 500 && < 600:
      return [
        rainLight,
        rainDark,
      ];
    case >= 600 && < 700:
      return [
        snowLight,
        snowDark,
      ];
    case >= 700 && < 800:
      return [
        atmosphereLight,
        atmosphereDark,
      ];
    case == 800:
      return [
        clearLight,
        clearDark,
      ];
    case >= 801 && < 900:
      return [
        cloudsLight,
        cloudsDark,
      ];
    default:
      return [Colors.white, Colors.black];
  }
}

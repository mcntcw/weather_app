import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:weather_app/screens/splash_screen.dart';
import 'package:weather_app/screens/weather_screen.dart';
import 'package:weather_app/services/determine_position.dart';
import 'package:weather_app/weather_bloc/weather_bloc.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  Paint.enableDithering = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
        fontFamily: "BeVietnam",
      ),
      home: FutureBuilder(
        future: determinePosition(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return BlocProvider<WeatherBloc>(
              create: (context) => WeatherBloc()..add(FetchWeather(snapshot.data as Position)),
              child: WeatherScreen(position: snapshot.data as Position),
            );
          } else {
            return const SplashScreen();
          }
        },
      ),
    );
  }
}

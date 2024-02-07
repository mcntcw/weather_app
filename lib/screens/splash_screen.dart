import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/utils/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

Future<bool> checkLocationState() async {
  bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (serviceEnabled == true) {
    return true;
  } else {
    return false;
  }
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment(0, 1 / 3),
          colors: [backgroundLight, backgroundDark],
          stops: [0.1, 0.9],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: FutureBuilder<bool>(
            future: Future.delayed(const Duration(seconds: 3), () => checkLocationState()),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.data == false) {
                  return splashContent('Enable GPS and restart the app');
                } else {
                  return splashContent('');
                }
              } else {
                return splashContent('');
              }
            },
          ),
        ),
      ),
    );
  }

  Center splashContent(String text) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Image.asset(
                'assets/images/ui/logo.png',
                height: 120,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              text,
              style: const TextStyle(color: Colors.white70, fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<FetchWeather>((event, emit) async {
      emit(WeatherLoading());
      try {
        WeatherFactory wf = WeatherFactory("d88ac0c5cb94afa9ee91b87ecfad81ab", language: Language.ENGLISH);
        Weather weather = await wf.currentWeatherByLocation(event.position.latitude, event.position.longitude);
        List<Weather> futureWeather =
            await wf.fiveDayForecastByLocation(event.position.latitude, event.position.longitude);
        final now = DateTime.now();
        final formatter = DateFormat('yyyy-MM-dd');
        List<Weather> next5DaysWeather = [];
        for (Weather weather in futureWeather) {
          final weatherDate = formatter.format(weather.date!);
          final currentDate = formatter.format(now);

          if (weatherDate != currentDate && weather.date!.hour == 12) {
            next5DaysWeather.add(weather);
          }
        }

        emit(WeatherLoaded(weather, next5DaysWeather));
      } catch (e) {
        emit(WeatherFailed());
      }
    });
  }
}

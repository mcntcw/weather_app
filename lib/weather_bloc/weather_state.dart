part of 'weather_bloc.dart';

sealed class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

final class WeatherInitial extends WeatherState {}

final class WeatherLoading extends WeatherState {}

final class WeatherFailed extends WeatherState {}

final class WeatherLoaded extends WeatherState {
  final Weather weather;
  final List<Weather> nextDaysWeather;

  const WeatherLoaded(
    this.weather,
    this.nextDaysWeather,
  );

  @override
  List<Object> get props => [weather];
}

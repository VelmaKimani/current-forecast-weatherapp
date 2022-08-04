part of 'weather_cubit.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}


class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherNotLoaded extends WeatherState {}


class WeatherLoaded extends WeatherState {
  final WeatherModel weather;
  const WeatherLoaded(this.weather);

  WeatherModel get getWeather => weather;

  @override
  List<Object> get props => [weather];
}


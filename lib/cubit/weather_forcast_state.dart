part of 'weather_forcast_cubit.dart';

abstract class WeatherForcasteState extends Equatable {
  const WeatherForcasteState();

  @override
  List<Object> get props => [];
}

class WeatherForcastNotLoaded extends WeatherForcasteState {}

class WeatherForcastInitial extends WeatherForcasteState {}

class WeatherForcastLoading extends WeatherForcasteState {}

class WeatherForcastLoaded extends WeatherForcasteState {
  final WeatherForcastModel weather;
  const WeatherForcastLoaded(this.weather);

  WeatherForcastModel get getWeather => weather;

  @override
  List<Object> get props => [weather];
}

import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import '../models/weather_forcast_model.dart';

import '../repositories/weather_repository.dart';

part 'weather_forcast_state.dart';

class WeatherForcastCubit extends Cubit<WeatherForcasteState> {
  WeatherRepository weatherRepository;

  WeatherForcastCubit(this.weatherRepository) : super(WeatherForcastInitial());

  Future<void> getWeatherForcast(Position position) async {
    log('called');
    {
      emit(WeatherForcastLoading());
      log(state.toString());
      try {
        WeatherForcastModel weather =
            await weatherRepository.getWeather5day(position);

        emit(WeatherForcastLoaded(weather));
      } catch (_) {
        emit(WeatherForcastNotLoaded());
      }
    }
  }
}

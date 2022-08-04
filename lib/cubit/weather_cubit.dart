import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

import '../models/weather_model.dart';
import '../repositories/weather_repository.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherRepository weatherRepository;

  WeatherCubit(this.weatherRepository) : super(WeatherInitial());

  Future<void> mapEventToState(Position position) async {
    log('called');
    {
      emit(WeatherLoading());
      log(state.toString());
      try {
        WeatherModel weather = await weatherRepository.getWeather(position);

        emit(WeatherLoaded(weather));
      } catch (_) {
        emit(WeatherNotLoaded());
      }
    }
  }
}

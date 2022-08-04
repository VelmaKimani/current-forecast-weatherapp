import 'dart:convert';
import 'dart:developer';

import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

import '../models/weather_forcast_model.dart';
import '../models/weather_model.dart';

class WeatherRepository {
  Future<WeatherModel> getWeather(Position position) async {
    final result = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=${position.latitude}&lon=${position.longitude}&appid=78fbb2284a9b5c083789b0273c025e2b'));

    if (result.statusCode == 200) {
      log('${WeatherModel.fromJson(jsonDecode(result.body))}');

      return WeatherModel.fromJson(jsonDecode(result.body));
    } else {
      throw Exception('Failed to load weather');
    }
  }

  Future<WeatherForcastModel> getWeather5day(Position position) async {
    final result = await http.get(Uri.parse(
        'http://api.openweathermap.org/data/2.5/forecast?lat=${position.latitude}&lon=${position.longitude}&appid=78fbb2284a9b5c083789b0273c025e2b'));

    if (result.statusCode == 200) {
      log('${WeatherForcastModel.fromJson(jsonDecode(result.body))}');

      return WeatherForcastModel.fromJson(jsonDecode(result.body));
    } else {
      throw Exception('Failed to load weather');
    }
  }
}

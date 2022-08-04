import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import '../../models/weather_forcast_model.dart';
import '../../utilis.dart';

// ignore: must_be_immutable
class Forecast extends StatelessWidget {
  final WeatherForcastModel weather;

  Forecast(this.weather, {Key? key}) : super(key: key);

  Widget forecastElement(ListElement element) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 70,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text(
                  "${DateFormat.E().format(element.dtTxt)} at ${DateFormat.j().format(element.dtTxt)}",
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Icon(
              Utilities.changeBackroundToIcon(element.weather.first.main),
              color: Colors.white,
            ),
            Text(
              '${(element.main.temp - 272.5).round()}º',
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
          ]),
    );
  }

  List<int> minTemperatureForecast = List.filled(5, 0);
  List<int> maxTemperatureForecast = List.filled(5, 0);
  List<String> dayForecast = List.filled(5, '');
  String errorMessage = '';

  final Geolocator geolocator = Geolocator();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children:
          weather.list.map((element) => forecastElement(element)).toList(),
    );
  }
}

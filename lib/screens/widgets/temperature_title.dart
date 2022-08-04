import 'package:flutter/material.dart';

import '../../models/weather_model.dart';
import 'weather_title.dart';

// ignore: must_be_immutable
class TemperatureTitle extends StatelessWidget {
  final WeatherModel weather;

  const TemperatureTitle(this.weather, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 17.0,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${(weather.main.tempMin - 272.5).round()}º',
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
                Text(
                  '${(weather.main.temp - 272.5).round()}º',
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
                Text(
                  '${(weather.main.tempMax - 272.5).round()}º',
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
              ],
            ),
          ),
          const WeatherTitle(),
        ],
      ),
    );
  }
}

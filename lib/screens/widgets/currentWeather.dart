import 'package:flutter/material.dart';

import '../../models/weather_model.dart';
import '../../utilis.dart';

// ignore: must_be_immutable
class CurrentWeather extends StatelessWidget {
  WeatherModel weather;

  CurrentWeather(this.weather, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .45,
      padding: const EdgeInsets.only(top: 50),
      child: Center(
        child: Row(children: [
          Container(
            //color: Colors.pink,
            margin: const EdgeInsets.only(bottom: 90, right: 20, left: 10),
            child: Icon(
              Utilities.changeBackroundToIcon(weather.weather.first.main),
              size: 100,
              color: const Color.fromARGB(255, 252, 116, 75),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 25, bottom: 10, left: 20),
                        child: Text(
                          '${(weather.main.temp - 272.5).round()}º',
                          style: const TextStyle(
                              fontSize: 60,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(),
                        child: Text(
                          weather.weather.first.description.toUpperCase(),
                          style: const TextStyle(
                              fontSize: 15, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ]),
          ),
        ]),
      ),
    );
  }
}

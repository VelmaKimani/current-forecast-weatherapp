// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weatherapp/cubit/weather_cubit.dart';
import 'package:weatherapp/screens/widgets/forecast.dart';
import 'package:weatherapp/screens/widgets/temperature_title.dart';

import '../cubit/weather_cubit.dart';
import '../cubit/weather_forcast_cubit.dart';
import 'widgets/currentWeather.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title, required this.position})
      : super(key: key);

  final String title;
  final Position position;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<WeatherCubit>().mapEventToState(widget.position);
    context.read<WeatherForcastCubit>().getWeatherForcast(widget.position);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'lib/assets/Sea - sunny.png',
            fit: BoxFit.cover,
          ),
          Column(
            children: [
              BlocBuilder<WeatherCubit, WeatherState>(
                  builder: (context, state) {
                if (state is WeatherInitial) {
                  return const CircularProgressIndicator();
                } else if (state is WeatherLoading) {
                  log(state.toString());
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  );
                } else if (state is WeatherLoaded) {
                  return Column(
                    children: [
                      CurrentWeather(
                        state.getWeather,
                      ),
                      TemperatureTitle(
                        state.weather,
                      ),
                    ],
                  );
                } else {
                  return const Text(
                    'Error',
                    style: TextStyle(color: Colors.white),
                  );
                }
              }),
              BlocBuilder<WeatherForcastCubit, WeatherForcasteState>(
                  builder: (context, state) {
                if (state is WeatherForcastInitial) {
                  return const CircularProgressIndicator();
                } else if (state is WeatherForcastLoading) {
                  log(state.toString());
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  );
                } else if (state is WeatherForcastLoaded) {
                  return Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(top: 1.0),
                      child: Forecast(
                        state.weather,
                      ),
                    ),
                  );
                } else {
                  return const Text(
                    'Error',
                    style: TextStyle(color: Colors.white),
                  );
                }
              }),
            ],
          )
        ],
      ),
    );
  }
}

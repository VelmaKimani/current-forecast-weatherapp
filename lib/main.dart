import 'package:flutter/material.dart';
import 'cubit/weather_forcast_cubit.dart';
import 'repositories/weather_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'screens/widgets/loading_screen.dart';
import 'cubit/weather_cubit.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider<WeatherCubit>(
        create: ((context) => WeatherCubit(WeatherRepository()))),
    BlocProvider<WeatherForcastCubit>(
        create: ((context) => WeatherForcastCubit(WeatherRepository()))),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoadingScreen(),
    );
  }
}

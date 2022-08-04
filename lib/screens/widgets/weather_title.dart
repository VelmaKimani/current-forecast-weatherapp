import 'package:flutter/material.dart';

class WeatherTitle extends StatefulWidget {
  const WeatherTitle({Key? key}) : super(key: key);

  @override
  State<WeatherTitle> createState() => _WeatherTitleState();
}

class _WeatherTitleState extends State<WeatherTitle> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              'min',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            Text(
              'Current',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            Text(
              'max',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ],
        ),
      ),
      const Divider(
        color: Colors.white,
        thickness: 1,
      )
    ]);
  }
}

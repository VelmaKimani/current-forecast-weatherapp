import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Utilities {
  static String changeBackroundToSvg(String image) {
    if (image.toLowerCase().contains("clouds")) {
      return "lib/assets/sunny-weather-svgrepo-com.svg";
    }
    if (image.toLowerCase().contains("rain")) {
      return "lib/assets/weather-rain-svgrepo-com.svg";
    }
    if (image.toLowerCase().contains("snow")) {
      return "lib/assets/snowing-weather-svgrepo-com.svg";
    }
    return "lib/assets/sunny-weather-svgrepo-com.svg";
  }

  static IconData changeBackroundToIcon(String image) {
    if (image.toLowerCase().contains("clouds")) {
      return Icons.cloud;
    }
    if (image.toLowerCase().contains("rain")) {
      return FontAwesomeIcons.cloudRain;
    }
    if (image.toLowerCase().contains("snow")) {
      return Icons.snowing;
    }
    return Icons.sunny;
  }
}

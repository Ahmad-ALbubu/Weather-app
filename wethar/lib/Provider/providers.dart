import 'package:flutter/material.dart';
import 'package:wethar/weathermodle/modles.dart';

class WeatherProvider with ChangeNotifier {
  weathermodle? _weatherData;

  weathermodle? get weatherData => _weatherData;

  set weatherData(weathermodle? value) {
    _weatherData = value;
    notifyListeners();
  }
}

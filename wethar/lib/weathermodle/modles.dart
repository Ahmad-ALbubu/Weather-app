import 'package:flutter/material.dart';

class weathermodle {
  final String city;
  final double temp;
  final double maxtemp;
  final double mintemp;
  final DateTime time; //will take time from api
  final String weathestatename;

  weathermodle({
    required this.city,
    required this.temp,
    required this.maxtemp,
    required this.mintemp,
    required this.weathestatename,
    required this.time,
  });
  factory weathermodle.formjsom(dynamic data) {
    //.fornjsom to understand it and can to work with it as block
    return weathermodle(
      //return to api to know the place for each
      city: data['name'],
      temp: data['main']['temp'] - 273.15,
      maxtemp: data['main']['temp_max'] - 273.15,
      mintemp: data['main']['temp_min'] - 273.15,
      time: DateTime.fromMillisecondsSinceEpoch(
        data['dt'] * 1000, // Convert seconds to milliseconds
      ), //it will recive string so we change it to understand this an work it
      weathestatename: data['weather'][0]['main'],
    );
  }
  String? setimage() {
    // Trimming the input strings to remove extra spaces
    String trimmedWeatherStateName = weathestatename?.trim() ?? '';
    String trimmedCity = city?.trim() ?? '';

    if (trimmedWeatherStateName == "Thunderstorm" || trimmedCity == "Thunder") {
      return "lib/assets/images/thunderstorm.png";
    } else if (trimmedWeatherStateName == "Rain") {
      return "lib/assets/images/rainy.png";
    } else if (trimmedWeatherStateName == "Snow") {
      return "lib/assets/images/snow.png";
    } else if (trimmedWeatherStateName == "Clear") {
      return "lib/assets/images/clear.png";
    } else if (trimmedWeatherStateName == "Clouds") {
      return "lib/assets/images/cloudy.png";
    }
    return null;
  }

  MaterialColor? setcolor() {
    if (temp <= 5) {
      return Colors.blueGrey;
    } else if (temp > 5 && temp <= 20) {
      return Colors.blue;
    } else if (temp >= 21) {
      return Colors.orange;
    }
    return Colors.blue;
  }

  MaterialColor? appcolor() {
    return Colors.orange;
  }
}

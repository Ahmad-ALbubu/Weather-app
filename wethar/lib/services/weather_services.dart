import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wethar/weathermodle/modles.dart';

class WeatherServices {
  Future<weathermodle?> getweather({required String cityname}) async {
    String baseurl = 'https://api.openweathermap.org/data/2.5/weather';
    String apikey = '47798569986463735168f9b2e7470c1a';
    Uri url = Uri.parse(
        '$baseurl?q=$cityname&appid=$apikey'); //make requset to take data
    http.Response response = await http.get(url); //take the data
    if (response.statusCode == 200) {
      dynamic data = jsonDecode(response
          .body); //put data in dynamic variable used jesondecode to understand it and we get it!!
      weathermodle weather = weathermodle.formjsom(data);
      return weather;
    } else {
      return null;
    }
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wethar/Provider/providers.dart';
import 'package:wethar/services/weather_services.dart';
import 'package:wethar/weathermodle/modles.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Searching",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 100),
          child: TextField(
            onSubmitted: (data) async {
              if (data.isNotEmpty) {
                WeatherServices services = WeatherServices();
                weathermodle? weather =
                    await services.getweather(cityname: data);
                if (weather != null) {
                  Provider.of<WeatherProvider>(context, listen: false)
                      .weatherData = weather;
                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text(
                          "Error: Are you sure of the name of the city?")));
                }
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Error: City name cannot be empty!!")));
              }
            },
            decoration: const InputDecoration(
              label: Text("Search"),
              hintText: "Enter the City",
              contentPadding:
                  EdgeInsets.symmetric(vertical: 32, horizontal: 32),
              suffixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.orange,
                  width: 2.0,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

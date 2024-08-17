import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wethar/Provider/providers.dart';
import 'package:wethar/search_page.dart';
import 'package:wethar/weathermodle/modles.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  weathermodle? weatherdata;
  Color? col;
  @override
  Widget build(BuildContext context) {
    var weatherdata = Provider.of<WeatherProvider>(context).weatherData;
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Weather App",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: weatherdata == null ? Colors.blue : Colors.orange,
          actions: [
            GestureDetector(
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SearchPage(),
                  ),
                );
              },
              child: const Icon(
                (Icons.search),
                color: Colors.white,
              ),
            ),
          ],
        ),
        body: weatherdata == null
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: const Text(
                        "There is no weather start",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Container(
                      child: const Text(
                        "searching now",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              )
            : Container(
                color: weatherdata.setcolor(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Text(
                        "${weatherdata?.city}",
                        style: const TextStyle(fontSize: 24),
                      ),
                    ),
                    Container(
                      child: Text(
                        "Updata at : ${weatherdata!.time.hour.toString()}:${weatherdata!.time.minute.toString().padLeft(2, '0')}",
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 24),
                            child: Container(
                              child: Image.asset(weatherdata.setimage()!),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 24),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 24),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 24),
                                child: Container(
                                  child: Text(
                                    "${weatherdata?.temp.round()}",
                                    style: TextStyle(fontSize: 24),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              Container(
                                child: Text(
                                  "Maxtemp:${weatherdata?.maxtemp.round()}",
                                  style: TextStyle(fontSize: 24),
                                ),
                              ),
                              Container(
                                child: Text(
                                  "Mintemp:${weatherdata?.mintemp.round()}",
                                  style: TextStyle(fontSize: 24),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Text(
                        "${weatherdata?.weathestatename}",
                        style: TextStyle(fontSize: 24),
                      ),
                    )
                  ],
                ),
              ));
  }
}

import 'package:flutter/material.dart';
import 'package:wether/model/Weathermodel.dart';
import 'package:wether/services/weatherServices.dart';

// ignore: must_be_immutable
class SearchPage extends StatelessWidget {
  VoidCallback? updateUi;
  SearchPage({this.updateUi});

  final searchController = TextEditingController();

  String? cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFfed081),
        centerTitle: true,
        title: Text("Search a city"),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xFFfed081),
            Color.fromARGB(223, 254, 208, 129),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                onSubmitted: (data) async {
                  cityName = data;
                  WeatherServices service = WeatherServices();
                  WeatherModel weather =
                      await service.getWeather(cityName: cityName!);
                  weatherData = weather;
                  updateUi!();
                  Navigator.pop(context);
                },
                controller: searchController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: "Search",
                  labelText: "Search",
                  suffixIcon: Icon(Icons.search),
                  filled: true,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  WeatherServices service = WeatherServices();
                  WeatherModel weather =
                      await service.getWeather(cityName: searchController.text);
                  weatherData = weather;
                  updateUi!();
                  Navigator.pop(context);
                },
                child: Text(
                  "Search",
                  style: TextStyle(fontSize: 20),
                ),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(Color.fromARGB(166, 254, 208, 129)),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

WeatherModel? weatherData;

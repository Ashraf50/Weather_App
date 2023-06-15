import 'dart:convert';

import 'package:http/http.dart';
import 'package:wether/model/Weathermodel.dart';

class WeatherServices {
  Future<WeatherModel> getWeather({required String cityName}) async {
    String baseUrl = "http://api.weatherapi.com/v1";
    String Key = "b4e219d68040444197b111430230706";
    Response response = await get(
      Uri.parse(
        "$baseUrl/forecast.json?key=$Key&q=$cityName&aqi=no",
      ),
    );
    Map receivedData = jsonDecode(response.body);
    var jsonData = receivedData["forecast"]["forecastday"][0]["day"];
    WeatherModel weather = WeatherModel(
      cityName: receivedData["location"]["name"],
      date: receivedData["location"]["localtime"],
      temp: jsonData["avgtemp_c"],
      Max_temp: jsonData["maxtemp_c"],
      min_temp: jsonData["mintemp_c"],
      weatherState: jsonData["condition"]["text"],
      Icon:  jsonData["condition"]["icon"],
      wind: receivedData["current"]["wind_kph"],
      humidity: receivedData["current"]["humidity"],
    );
    return weather;
  }
}

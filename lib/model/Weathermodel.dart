class WeatherModel {
  final String cityName;
  final String date;
  final double temp;
  final double Max_temp;
  final double min_temp;
  final String weatherState;
  final String Icon;
  final double wind;
  final int humidity;
  WeatherModel({
    required this.cityName,
    required this.date,
    required this.temp,
    required this.Max_temp,
    required this.min_temp,
    required this.weatherState,
    required this.Icon,
    required this.wind,
    required this.humidity
  });
}

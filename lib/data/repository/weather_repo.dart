import 'package:http/http.dart';
import 'dart:convert';
import 'package:weather_app_using_bloc/data/models/weather.dart';

class WeatherRepo {
  get http => null;

  get location => null;

  Future<WeatherModel> getWeather(String city) async {
    final result = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=a81933865f640accec828cb65f8eec1b"));
    if (result.statusCode != 200) {
      throw Exception();
    }
    final response = json.decode(result.body);
    return WeatherModel.fromJson(response);
  }
}

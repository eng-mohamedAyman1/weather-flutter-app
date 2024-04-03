import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather/WeatherModel.dart';

class WeatherService {
  String ApiKey = "e2bc4c36e5a54c43ac8181237232012";
  String BaseUrl = "https://api.weatherapi.com/v1";
  Future<WeatherModel> weatherSearch({required String cityName}) async {
    Uri uri = Uri.parse("$BaseUrl/forecast.json?key=$ApiKey&q=$cityName");
    http.Response response = await http.get(uri) as http.Response;
    Map<String, dynamic> json = jsonDecode(response.body);
    var data = json["forecast"]["forecastday"][0]["day"];
    WeatherModel? Model = WeatherModel(
      Cityname: json["location"]["name"],
      localtime: json["location"]["localtime"],
      temp: data["avgtemp_c"],
      Maxtemp: data["maxtemp_c"],
      Mitemp: data["mintemp_c"],
      StateWeather: data["condition"]["text"],
      icon: data["condition"]["icon"],
    );
    return Model;
  }
}

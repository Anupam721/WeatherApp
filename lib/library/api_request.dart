import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:weather_app/library/utils.dart';
import 'package:weather_app/models/Weather.dart';

// void getHttp() async {
//   try {
//     var response = await Dio().get('http://www.google.com');
//     print(response);
//   } catch (e) {
//     print(e);
//   }
// }

// api.openweathermap.org/data/2.5/weather?lat=28.644800&lon=77.216721&appid=d2d4ad0dc2ef04c44fa5c63247642b2b

Future<WeatherData> getData() async {
  String url = 'https://api.openweathermap.org/data/2.5/weather?';
  Map<String, dynamic> queryParams = {
    'lat': 28.644800,
    'lon': 77.216721,
    'appid': 'd2d4ad0dc2ef04c44fa5c63247642b2b',
    'units': 'metric'
  };

  Response response = await Dio().get(url, queryParameters: queryParams);
  if (response.statusCode != 200 && response.statusCode != 201) {
    print("Some Error occurred-${response.statusCode}");
  }
  return WeatherData.fromJson(response.data);
}

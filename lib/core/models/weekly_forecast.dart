import 'package:flutter_antonx_boilerplate/core/models/weather_item.dart';

class WeatherForecast {
  List<WeatherItem> list;

  WeatherForecast({required this.list});

  factory WeatherForecast.fromJson(Map<String, dynamic> json) {
    var list = json['list'] as List;
    List<WeatherItem> weatherItems =
        list.map((item) => WeatherItem.fromJson(item)).toList();
    return WeatherForecast(list: weatherItems);
  }
}

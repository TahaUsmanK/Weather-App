import 'package:flutter_antonx_boilerplate/core/models/weather_forecast.dart';

class WeatherForecast {
  final List<WeatherForecastDaily> daily;

  WeatherForecast({required this.daily});

  factory WeatherForecast.fromJson(Map<String, dynamic> json) {
    List<WeatherForecastDaily> dailyForecasts = [];
    if (json['daily'] != null) {
      json['daily'].forEach((day) {
        dailyForecasts.add(WeatherForecastDaily.fromJson(day));
      });
    }
    return WeatherForecast(daily: dailyForecasts);
  }
}

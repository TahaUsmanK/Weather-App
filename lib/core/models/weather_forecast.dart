class WeatherForecastDaily {
  final int dt;
  final double tempMax;
  final double tempMin;
  final List<WeatherDescription> weather;

  WeatherForecastDaily({
    required this.dt,
    required this.tempMax,
    required this.tempMin,
    required this.weather,
  });

  factory WeatherForecastDaily.fromJson(Map<String, dynamic> json) {
    List<WeatherDescription> weatherList = [];
    if (json['weather'] != null) {
      json['weather'].forEach((weatherData) {
        weatherList.add(WeatherDescription.fromJson(weatherData));
      });
    }

    return WeatherForecastDaily(
      dt: json['dt'],
      tempMax: json['temp']['max'].toDouble(),
      tempMin: json['temp']['min'].toDouble(),
      weather: weatherList,
    );
  }
}

class WeatherDescription {
  final String main;
  final String description;

  WeatherDescription({
    required this.main,
    required this.description,
  });

  factory WeatherDescription.fromJson(Map<String, dynamic> json) {
    return WeatherDescription(
      main: json['main'],
      description: json['description'],
    );
  }
}

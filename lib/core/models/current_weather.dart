class CurrentWeather {
  final double temperature;
  final double feelsLike;
  final String description;
  final String iconUrl;
  final double sunrise;
  final double sunset;
  final int humidity;
  final double windSpeed;
  final double pressure;
  final int visibility;
  final double airQuality;
  final double rainfall;

  CurrentWeather.fromJson(Map<String, dynamic> json)
      : temperature = json['current']['temp'].toDouble(),
        feelsLike = json['current']['feels_like'].toDouble(),
        description = json['current']['weather'][0]['description'],
        iconUrl =
            'https://openweathermap.org/img/wn/${json['current']['weather'][0]['icon']}@2x.png',
        sunrise = json['current']['sunrise'].toDouble(),
        sunset = json['current']['sunset'].toDouble(),
        humidity = json['current']['humidity'],
        windSpeed = json['current']['wind_speed'].toDouble(),
        pressure = json['current']['pressure'].toDouble(),
        visibility = json['current']['visibility'],
        airQuality = json['current']['air_quality']?.toDouble() ?? 0.0,
        rainfall = json['current']['rain']?.toDouble() ?? 0.0;
}

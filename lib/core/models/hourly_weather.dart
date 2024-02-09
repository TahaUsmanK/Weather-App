class HourlyWeather {
  final DateTime dateTime;
  final double temperature;
  final String description;
  final String iconUrl;

  HourlyWeather.fromJson(Map<String, dynamic> json)
      : dateTime = DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000),
        temperature = json['temp'].toDouble(),
        description = json['weather'][0]['description'],
        iconUrl =
            'https://openweathermap.org/img/wn/${json['weather'][0]['icon']}@2x.png';
}

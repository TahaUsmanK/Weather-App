class WeeklyWeather {
  final DateTime dateTime;
  final double minTemp;
  final double maxTemp;
  final String description;
  final String iconUrl;

  WeeklyWeather.fromJson(Map<String, dynamic> json)
      : dateTime = DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000),
        minTemp = json['temp']['min'].toDouble(),
        maxTemp = json['temp']['max'].toDouble(),
        description = json['weather'][0]['description'],
        iconUrl =
            'https://openweathermap.org/img/wn/${json['weather'][0]['icon']}@2x.png';
}

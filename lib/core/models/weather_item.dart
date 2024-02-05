class WeatherItem {
  final double minTemp;
  final String icon;
  final String dayOfWeek;

  WeatherItem(
      {required this.minTemp, required this.icon, required this.dayOfWeek});

  factory WeatherItem.fromJson(Map<String, dynamic> json) {
    return WeatherItem(
      minTemp: json['temp']['min'].toDouble(),
      icon: json['weather'][0]['icon'],
      dayOfWeek: json['dayofweek'],
    );
  }
}

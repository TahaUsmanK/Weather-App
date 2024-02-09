import 'package:flutter/foundation.dart';

class HomeViewModel extends ChangeNotifier {
  late String _city = 'N/A'; // Initialize with empty string
  late double _currentTemperature = 0; // Initialize with 0
  late String _weatherDescription =
      'Mostly Cloud'; // Initialize with empty string
  late double _maxTemperature = 0; // Initialize with 0
  late double _minTemperature = 0;

  String get city => _city;
  double get currentTemperature => _currentTemperature;
  String get weatherDescription => _weatherDescription;
  double get maxTemperature => _maxTemperature;
  double get minTemperature => _minTemperature;

  void updateWeatherData(Map<String, dynamic> weatherData) {
    _city = weatherData['timezone'];
    _currentTemperature = weatherData['current']['temp'];
    _weatherDescription = weatherData['current']['weather'][0]['description'];
    _maxTemperature = weatherData['daily'][0]['temp']['max'];
    _minTemperature = weatherData['daily'][0]['temp']['min'];
    notifyListeners();
  }
}

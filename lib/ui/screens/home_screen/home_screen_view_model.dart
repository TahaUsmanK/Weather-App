import 'package:flutter/foundation.dart';
import 'package:flutter_antonx_boilerplate/core/services/api_services.dart';
import 'package:flutter_antonx_boilerplate/core/services/location_service.dart';

class HomeViewModel extends ChangeNotifier {
  String _city = 'N/A';
  double _currentTemperature = 0.0;
  String _weatherDescription = '';
  double _maxTemperature = 0.0;
  double _minTemperature = 0.0;
  Map<String, dynamic>? _weatherData;

  String get city => _city;
  double get currentTemperature => _currentTemperature;
  String get weatherDescription => _weatherDescription;
  double get maxTemperature => _maxTemperature;
  double get minTemperature => _minTemperature;
  Map<String, dynamic>? get weatherData => _weatherData;

  Future<void> fetchWeatherData() async {
    final position = await getCurrentLocation();
    if (position != null) {
      final weatherData = await ApiService.fetchWeatherData(
        lat: position.latitude,
        lon: position.longitude,
      );
      _weatherData = weatherData;
      updateWeatherData(weatherData);
    } else {
      print('Unable to fetch current location');
    }
  }

  Future<void> searchCity(String cityName) async {
    final weatherData = await ApiService.fetchWeatherData(cityName: cityName);
    _weatherData = weatherData;
    updateWeatherData(weatherData);
  }

  Future<void> updateWeatherData(Map<String, dynamic>? weatherData) async {
    if (weatherData == null) {
      // Handle the case where weather data is null
      return;
    }

    final position = await getCurrentLocation();
    if (position != null) {
      final cityName = await getCityName(position);
      _city = cityName;
    }

    _currentTemperature = weatherData['current']['temp']?.toDouble() ?? 0.0;
    _weatherDescription =
        weatherData['current']['weather'][0]['description'] ?? '';
    _maxTemperature = weatherData['daily'][0]['temp']['max']?.toDouble() ?? 0.0;
    _minTemperature = weatherData['daily'][0]['temp']['min']?.toDouble() ?? 0.0;

    notifyListeners();
  }
}

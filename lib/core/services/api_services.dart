import 'dart:convert';
import 'package:dio/dio.dart';

class ApiService {
  static final Dio _dio = Dio();

  static Future<Map<String, dynamic>> fetchWeatherData(
      {double? lat, double? lon, String cityName = ''}) async {
    final baseUri = 'https://api.openweathermap.org/data/2.5/onecall';
    final apiKey = '1369dd6b5ae78fc9952261ab9aa236b4';

    final queryParameters = {
      'lat': lat?.toString(),
      'lon': lon?.toString(),
      'appid': apiKey,
      'exclude': 'minutely,alerts',
      'units': 'metric',
      'lang': 'en',
    };

    if (cityName.isNotEmpty) {
      queryParameters['q'] = cityName;
    }

    final uri = Uri.parse(baseUri).replace(queryParameters: queryParameters);

    try {
      final response = await _dio.get(uri.toString());
      if (response.statusCode == 200) {
        final dynamic responseData = response.data;
        print('Response data: $responseData');
        return responseData; // Directly return the response data
      } else {
        throw Exception('Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching weather data: $e');
      rethrow;
    }
  }
}

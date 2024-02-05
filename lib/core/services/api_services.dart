import 'dart:math';
import 'package:dio/dio.dart';
import 'package:flutter_antonx_boilerplate/core/config/config.dart';
import 'package:flutter_antonx_boilerplate/core/models/responses/base_responses/request_response.dart';
import 'package:flutter_antonx_boilerplate/locator.dart';
import 'package:logger/logger.dart';

class ApiServices {
  final _config = locator<Config>();
  final String apiKey = 'yqZlfaolqpWLaJX9LZ8CJo2fCEUK3wTKXGNkdjgZ';
  final Logger _logger = Logger();
  var jsonList;

  Future<Dio> launchDio() async {
    Dio dio = Dio();

    dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
    dio.options.headers['X-Api-Key'] = '$apiKey';
    return dio;
  }

  Future<RequestResponse> getWeather({
    required double latitude,
    required double longitude,
    String? city,
  }) async {
    Dio dio = await launchDio();

    try {
      String baseUrl = '${_config.baseUrl}';
      if (city != null) {
        baseUrl += 'city=$city';
      } else {
        baseUrl += 'lat=$latitude&lon=$longitude';
      }

      final response = await dio.get(baseUrl);

      _logger.d('Response: ${response.statusCode} ${response.data}');
      if (response.statusCode == 200) {
        Map<String, dynamic> responseData =
            response.data as Map<String, dynamic>;
        jsonList = responseData;
        return RequestResponse(true, data: jsonList);
      } else if (response.statusCode == 500) {
        return RequestResponse(false, error: 'Server Error');
      } else {
        return RequestResponse(false, error: 'Something went wrong: $e');
      }
    } catch (e) {
      return RequestResponse(false, error: 'Error: $e');
    }
  }
}

import 'package:flutter/material.dart';

class WeatherWidget extends StatelessWidget {
  final Map<String, dynamic>? weatherData;

  const WeatherWidget({Key? key, required this.weatherData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: _buildWeatherWidgets(),
      ),
    );
  }

  List<Widget> _buildWeatherWidgets() {
    List<Widget> widgets = [];

    if (weatherData == null) {
      widgets.add(CircularProgressIndicator());
    } else {
      if (weatherData!['current'] != null) {
        widgets.addAll(_buildCurrentWeather());
      }
      if (weatherData!['hourly'] != null) {
        widgets.addAll(_buildHourlyWeather());
      }
      if (weatherData!['daily'] != null) {
        widgets.addAll(_buildDailyWeather());
      }
    }

    return widgets;
  }

  List<Widget> _buildCurrentWeather() {
    List<Widget> widgets = [];
    final currentWeather = weatherData!['current'];

    widgets.addAll([
      _buildWeatherItem('Current Weather:', currentWeather),
    ]);

    return widgets;
  }

  List<Widget> _buildHourlyWeather() {
    List<Widget> widgets = [];
    final hourlyWeather = weatherData!['hourly'];

    widgets.add(SizedBox(height: 10));

    for (int i = 0; i < hourlyWeather.length && i < 8; i++) {
      widgets.addAll([
        _buildWeatherItem('Hourly Forecast:', hourlyWeather[i]),
        SizedBox(height: 10),
      ]);
    }

    return widgets;
  }

  List<Widget> _buildDailyWeather() {
    List<Widget> widgets = [];
    final dailyWeather = weatherData!['daily'];

    widgets.add(SizedBox(height: 10));

    for (int i = 0; i < dailyWeather.length; i++) {
      widgets.addAll([
        _buildWeatherItem('Daily Forecast:', dailyWeather[i]),
        SizedBox(height: 10),
      ]);
    }

    return widgets;
  }

  Widget _buildWeatherItem(String title, Map<String, dynamic> data) {
    return Column(
      children: [
        Text(title),
        Text(
            'Temperature: ${data['temp'] ?? 'N/A'}°C'), // Handle null temperature
        Text('Description: ${data['weather'][0]['description'] ?? 'N/A'}'),
        Text('Humidity: ${data['humidity'] ?? 'N/A'}%'), // Handle null humidity
        Text('Wind Speed: ${data['wind_speed'] ?? 'N/A'}'),
        Text('Pressure: ${data['pressure'] ?? 'N/A'}'),
        Text('Visibility: ${data['visibility'] ?? 'N/A'}'),
        Text('UV Index: ${data['uvi'] ?? 'N/A'}'),
        Text('Rainfall: ${data['rainfall'] ?? 'N/A'}mm'),
        Text(
            'Sunset: ${_convertTime(data['sunset'] ?? 0)}'), // Handle null sunset time
        Text(
            'Sunrise: ${_convertTime(data['sunrise'] ?? 0)}'), // Handle null sunrise time
        Text('Feels Like: ${data['feels_like'] ?? 'N/A'}'),
        Text('Pressure: ${data['pressure'] ?? 'N/A'}'),
        Text('Clouds: ${data['clouds'] ?? 'N/A'}'),
      ],
    );
  }

  String _convertTime(int unixTimestamp) {
    if (unixTimestamp == 0) return 'N/A';
    DateTime dateTime =
        DateTime.fromMillisecondsSinceEpoch(unixTimestamp * 1000);
    return '${dateTime.hour}';
  }
}

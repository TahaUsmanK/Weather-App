import 'package:flutter/material.dart';

class HourlyWeatherWidget extends StatelessWidget {
  final List<dynamic>? hourlyWeatherData;

  const HourlyWeatherWidget({Key? key, this.hourlyWeatherData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120, // Adjust height according to your design
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: hourlyWeatherData?.length ?? 0,
        itemBuilder: (context, index) {
          final hourlyData = hourlyWeatherData![index];
          final temperature = hourlyData['temp'];
          final weatherDescription = hourlyData['weather'][0]['description'];
          final hour = _extractHour(hourlyData['dt']);
          final weatherIconUrl =
              _getWeatherIconUrl(hourlyData['weather'][0]['icon']);

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  hour,
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 5),
                Image.network(
                  weatherIconUrl,
                  width: 50, // Adjust icon size as needed
                  height: 50,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(Icons.error,
                        color: Colors.white); // Placeholder icon for errors
                  },
                ),
                SizedBox(height: 5),
                Text(
                  '${temperature.toString()}°C',
                  style: TextStyle(
                      color:
                          Colors.white), // Adjust temperature format as needed
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  String _extractHour(int timestamp) {
    final dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    return '${dateTime.hour}:00'; // Format hour as needed
  }

  String _getWeatherIconUrl(String iconCode) {
    return 'https://openweathermap.org/img/wn/$iconCode.png';
  }
}

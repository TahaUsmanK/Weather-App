import 'package:flutter/material.dart';

class HourlyWeatherWidget extends StatelessWidget {
  final List<dynamic>? hourlyWeatherData;

  const HourlyWeatherWidget({Key? key, this.hourlyWeatherData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: hourlyWeatherData?.length ?? 0,
        itemBuilder: (context, index) {
          final hourlyData = hourlyWeatherData![index];
          final temperature = hourlyData['temp'];
          final weatherDescription = hourlyData['weather'][0]['description'];
          final hour = _extractHour(hourlyData['dt'], index);
          final weatherIconUrl =
              _getWeatherIconUrl(hourlyData['weather'][0]['icon']);

          final isCurrentHour = _isCurrentHour(hourlyData['dt']);

          return Padding(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 28, bottom: 54),
            child: Material(
              elevation: 6,
              borderRadius: BorderRadius.circular(30),
              child: Container(
                decoration: BoxDecoration(
                  color: isCurrentHour
                      ? Color.fromARGB(232, 31, 29, 71) // Lightened color
                      : Color.fromARGB(255, 31, 29, 71), // Original color
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 16),
                    Text(
                      isCurrentHour ? 'Now' : hour,
                      style: TextStyle(
                        color: isCurrentHour
                            ? Colors.white
                            : Colors.white70, // Lightened text color
                      ),
                    ),
                    Image.network(
                      weatherIconUrl,
                      width: 60, // Adjust icon size as needed
                      height: 70,
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(Icons.error,
                            color: Colors.white); // Placeholder icon for errors
                      },
                    ),
                    Text(
                      '${temperature}°C',
                      style: TextStyle(
                        color: Colors.white, // Always white for temperature
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  String _extractHour(int timestamp, int index) {
    final currentDateTime = DateTime.now();
    final dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    if (currentDateTime.hour == dateTime.hour && index == 0) {
      return 'Now';
    } else {
      var hour = dateTime.hour;
      var period = 'AM';

      if (hour >= 12) {
        period = 'PM';
        if (hour > 12) {
          hour -= 12;
        }
      }

      return '$hour $period'; // Format hour with AM/PM
    }
  }

  bool _isCurrentHour(int timestamp) {
    final currentDateTime = DateTime.now();
    final dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    return currentDateTime.hour == dateTime.hour;
  }

  String _getWeatherIconUrl(String iconCode) {
    return 'https://openweathermap.org/img/wn/$iconCode.png';
  }
}

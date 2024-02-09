import 'package:flutter/material.dart';

class WeeklyWeatherWidget extends StatelessWidget {
  final List<dynamic>? weeklyWeatherData;

  const WeeklyWeatherWidget({Key? key, this.weeklyWeatherData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120, // Adjust height according to your design
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: weeklyWeatherData?.length ?? 0,
        itemBuilder: (context, index) {
          final dailyData = weeklyWeatherData![index];
          final temperature = dailyData['temp']['day'];
          final weatherDescription = dailyData['weather'][0]['description'];
          final dayOfWeek = _getDayOfWeek(index);
          final weatherIconUrl =
              _getWeatherIconUrl(dailyData['weather'][0]['icon']);

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  dayOfWeek,
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

  String _getDayOfWeek(int index) {
    final now = DateTime.now();
    final dayOfWeekIndex = (now.weekday + index) % 7;
    return _dayOfWeekToString(dayOfWeekIndex);
  }

  String _dayOfWeekToString(int dayOfWeekIndex) {
    switch (dayOfWeekIndex) {
      case 0:
        return 'Sunday';
      case 1:
        return 'Monday';
      case 2:
        return 'Tuesday';
      case 3:
        return 'Wednesday';
      case 4:
        return 'Thursday';
      case 5:
        return 'Friday';
      case 6:
        return 'Saturday';
      default:
        return '';
    }
  }

  String _getWeatherIconUrl(String iconCode) {
    return 'https://openweathermap.org/img/wn/$iconCode.png';
  }
}

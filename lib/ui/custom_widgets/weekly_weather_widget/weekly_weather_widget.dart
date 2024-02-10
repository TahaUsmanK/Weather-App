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

          final isCurrentDay = index == 0; // Check if it's the current day

          return Padding(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 28, bottom: 54),
            child: Material(
              elevation: 6,

              borderRadius: BorderRadius.circular(30),
              color: isCurrentDay
                  ? Color.fromARGB(223, 34, 32, 75) // Lightened color

                  : Color.fromARGB(
                      255, 31, 29, 71), // Lighten color for the current day
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 16),
                    Text(
                      dayOfWeek,
                      style: TextStyle(color: Colors.white),
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
                          color: Colors
                              .white), // Adjust temperature format as needed
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

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/hourly_weather/hourly_weather.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/search_bar/search_bar.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/weekly_weather_widget/weekly_weather_widget.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/home_screen/home_screen_view_model.dart';
import 'package:provider/provider.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Ensure that HomeViewModel is provided above this widget
    Provider.of<HomeViewModel>(context, listen: false).fetchWeatherData();
  }

  Future<void> _searchCity(String cityName) async {
    await Provider.of<HomeViewModel>(context, listen: false)
        .searchCity(cityName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/big/background.png',
            fit: BoxFit.cover,
          ),
          BackdropFilter(
            filter: ImageFilter.blur(
                sigmaX: 5, sigmaY: 5), // Reduce blur sigma values
            child: Container(
              color: const Color.fromARGB(255, 31, 29, 71).withOpacity(0.7),
            ),
          ),
          Positioned(
            top: 70,
            left: 40,
            child: Text(
              'Weather',
              style: TextStyle(
                fontSize: 32,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            top: 130,
            left: 16,
            right: 16,
            child: CustomSearchBar(
              onSearch: _searchCity,
            ),
          ),
          Positioned(
            top: 200,
            left: 16,
            right: 16,
            child: Consumer<HomeViewModel>(
              builder: (context, viewModel, _) {
                final weatherData = viewModel.weatherData;
                if (weatherData == null || weatherData.isEmpty) {
                  return CircularProgressIndicator();
                } else {
                  // Ensure weatherData['hourly'] is cast to List<Map<String, dynamic>>
                  final hourlyData = (weatherData['hourly'] as List?)
                          ?.cast<Map<String, dynamic>>() ??
                      [];
                  return HourlyWeatherWidget(hourlyWeatherData: hourlyData);
                }
              },
            ),
          ),
          Positioned(
            top: 350,
            left: 16,
            right: 16,
            child: Consumer<HomeViewModel>(
              builder: (context, viewModel, _) {
                final weatherData = viewModel.weatherData;
                if (weatherData == null || weatherData.isEmpty) {
                  return CircularProgressIndicator();
                } else {
                  // Ensure weatherData['daily'] is cast to List<Map<String, dynamic>>
                  final weeklyData = (weatherData['daily'] as List?)
                          ?.cast<Map<String, dynamic>>() ??
                      [];
                  return WeeklyWeatherWidget(weeklyWeatherData: weeklyData);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

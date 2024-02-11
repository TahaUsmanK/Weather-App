import 'package:flutter/material.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/bottom_sheet_widget/bottom_sheet_weather_forecast.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/hourly_weather/hourly_weather.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/weekly_weather_widget/weekly_weather_widget.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/home_screen/home_screen_view_model.dart';
import 'package:provider/provider.dart';

class WeatherHourlyDaily extends StatefulWidget {
  const WeatherHourlyDaily({Key? key}) : super(key: key);

  @override
  State<WeatherHourlyDaily> createState() => _WeatherHourlyDailyState();
}

class _WeatherHourlyDailyState extends State<WeatherHourlyDaily> {
  @override
  void initState() {
    super.initState();
    // Fetch weather data when the widget is initialized
    Provider.of<HomeViewModel>(context, listen: false).fetchWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: <Widget>[
          SizedBox(height: 8),
          Container(
            width: 40,
            height: 6,
            decoration: BoxDecoration(
              color: Colors.white30,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          SizedBox(height: 10),
          TabBar(
            labelColor: Colors.white,
            indicatorColor: Colors.white,
            tabs: [
              Tab(text: 'Hourly Forecast'),
              Tab(text: 'Daily Forecast'),
            ],
          ),
          SizedBox(width: 10),
          Divider(thickness: 2),
          Expanded(
            child: TabBarView(
              children: [
                _buildHourlyForecast(),
                BottomSheetWeather(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHourlyForecast() {
    return Consumer<HomeViewModel>(
      builder: (context, viewModel, _) {
        final weatherData = viewModel.weatherData;
        if (weatherData == null || weatherData.isEmpty) {
          return Center(child: CircularProgressIndicator());
        } else {
          final hourlyData =
              (weatherData['hourly'] as List?)?.cast<Map<String, dynamic>>() ??
                  [];
          return HourlyWeatherWidget(hourlyWeatherData: hourlyData);
        }
      },
    );
  }
}

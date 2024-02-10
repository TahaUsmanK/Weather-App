import 'package:flutter/material.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/hourly_weather/hourly_weather.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/weekly_weather_widget/weekly_weather_widget.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/home_screen/home_screen_view_model.dart';
import 'package:provider/provider.dart';

class DraggebleBottomSheet extends StatefulWidget {
  const DraggebleBottomSheet({Key? key}) : super(key: key);

  @override
  State<DraggebleBottomSheet> createState() => _DraggebleBottomSheetState();
}

class _DraggebleBottomSheetState extends State<DraggebleBottomSheet> {
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
      child: DraggableScrollableSheet(
        initialChildSize: 0.40,
        minChildSize: 0.40,
        maxChildSize: 0.82,
        builder: (context, controller) => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            color: Color.fromARGB(166, 46, 51, 90),
          ),
          child: Column(
            children: [
              _buildTabBar(),
              Expanded(
                child: TabBarView(
                  children: [
                    _buildHourlyForecast(),
                    _buildWeeklyForecast(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    return TabBar(
      labelColor: Colors.grey.shade300,
      indicatorColor: Colors.white,
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorWeight: 3,
      tabs: [
        Tab(
          text: 'Hourly Forecast',
        ),
        Tab(
          text: 'Weekly Forecast',
        ),
      ],
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

  Widget _buildWeeklyForecast() {
    return Consumer<HomeViewModel>(
      builder: (context, viewModel, _) {
        final weatherData = viewModel.weatherData;
        if (weatherData == null || weatherData.isEmpty) {
          return Center(child: CircularProgressIndicator());
        } else {
          final weeklyData =
              (weatherData['daily'] as List?)?.cast<Map<String, dynamic>>() ??
                  [];
          return WeeklyWeatherWidget(weeklyWeatherData: weeklyData);
        }
      },
    );
  }
}

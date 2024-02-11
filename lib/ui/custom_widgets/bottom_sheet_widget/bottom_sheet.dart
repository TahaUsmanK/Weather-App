import 'package:flutter/material.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/hourly_weather/hourly_weather.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/weekly_weather_widget/weekly_weather_widget.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/home_screen/home_screen_view_model.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:provider/provider.dart';
import 'draggable_bottom_sheet_nullsafety.dart';

class BottomSheets extends StatefulWidget {
  const BottomSheets({Key? key}) : super(key: key);

  @override
  State<BottomSheets> createState() => _BottomSheetsState();
}

class _BottomSheetsState extends State<BottomSheets>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  final double _minHeight = 180;
  final double _maxHeight = 600;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width * 0.9;

    return DraggableBottomSheet(
      previewChild: _buildHourlyAndWeeklyForecast(width),
      expandedChild: _buildHourlyAndWeeklyForecast(width),
      minExtent: _minHeight,
      maxExtent: _maxHeight,
    );
  }

  Widget _buildHourlyAndWeeklyForecast(double width) {
    return GlassContainer(
      width: width,
      height: _maxHeight,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      blur: 7,
      borderColor: Colors.transparent,
      alignment: Alignment.topCenter,
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xff612FAB).withAlpha(100),
          Color(0xff612FAB).withAlpha(50),
        ],
        stops: [0.3, 1],
      ),
      child: Column(
        children: [
          TabBar(
            controller: _controller,
            labelColor: Colors.grey.shade300,
            indicatorColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 3,
            tabs: [
              Tab(text: 'Hourly Forecast'),
              Tab(text: 'Weekly Forecast'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _controller,
              children: [
                _buildHourlyForecast(),
                _buildWeeklyForecast(),
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

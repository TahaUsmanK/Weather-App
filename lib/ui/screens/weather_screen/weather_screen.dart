import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_antonx_boilerplate/core/services/api_services.dart';
import 'package:flutter_antonx_boilerplate/core/services/location_service.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/search_bar/search_bar.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/weather_info/weather_info.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/home_screen/home_screen_view_model.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/weather_screen/weather_screen_view_model.dart';
import 'package:provider/provider.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late HomeViewModel _weatherViewModel;

  @override
  void initState() {
    super.initState();
    _weatherViewModel = HomeViewModel();
    _fetchWeatherData();
  }

  Future<void> _fetchWeatherData() async {
    final position = await getCurrentLocation();
    if (position != null) {
      final weatherData = await ApiService.fetchWeatherData(
        lat: position.latitude,
        lon: position.longitude,
      );
      _weatherViewModel.updateWeatherData(weatherData);
    } else {
      print('Unable to fetch current location');
    }
  }

  Future<void> _searchCity(String cityName) async {
    final weatherData = await ApiService.fetchWeatherData(cityName: cityName);
    _weatherViewModel.updateWeatherData(weatherData);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _weatherViewModel,
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'assets/big/background.png',
              fit: BoxFit.cover,
            ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 500, sigmaY: 500),
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
              child: WeatherInfoWidget(),
            ),
          ],
        ),
      ),
    );
  }
}

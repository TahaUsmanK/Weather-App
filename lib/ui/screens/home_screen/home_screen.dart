import 'package:flutter/material.dart';
import 'package:flutter_antonx_boilerplate/core/services/api_services.dart';
import 'package:flutter_antonx_boilerplate/core/services/location_service.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/bottom_nav_bar/bottom_navigator_bar.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/bottom_sheet/bottom_sheet.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/floating_action_button/floating_action_button.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/home_screen/home_screen_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    _fetchWeatherData();
  }

  Future<void> _fetchWeatherData() async {
    final position = await getCurrentLocation();
    if (position != null) {
      final weatherData = await ApiService.fetchWeatherData(
        lat: position.latitude,
        lon: position.longitude,
      );
      // Update weather data in the ViewModel
      Provider.of<HomeViewModel>(context, listen: false)
          .updateWeatherData(weatherData);
    } else {
      print('Unable to fetch current location');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<HomeViewModel>(
        builder: (context, homeViewModel, _) {
          return Stack(
            fit: StackFit.expand,
            children: [
              // Background Image
              Image.asset(
                'assets/big/background.png',
                fit: BoxFit.cover,
              ),
              // Weather Texts
              Positioned(
                top: 56,
                right: 100,
                child: Column(
                  children: [
                    Text(
                      '${homeViewModel.city}',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '${homeViewModel.currentTemperature}°',
                      style: TextStyle(
                        fontSize: 50,
                        color: Colors.white,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 14),
                      child: Text(
                        '${homeViewModel.weatherDescription}',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          'H:${homeViewModel.maxTemperature}°',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        SizedBox(width: 10),
                        Text(
                          'L:${homeViewModel.minTemperature}°',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // House Image
              Positioned(
                top: 110,
                bottom: 0,
                left: 0,
                child: Image.asset(
                  'assets/big/house.png',
                  width: 390,
                  height: 390,
                ),
              ),
              // Draggable Bottom Sheet
              DraggebleBottomSheet(),
            ],
          );
        },
      ),
      floatingActionButton: FAB(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

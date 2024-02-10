import 'package:flutter/material.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/home_screen/home_screen_view_model.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/weather_screen/weather_screen.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Color.fromARGB(255, 30, 27, 70),
      currentIndex: 0,
      items: [
        BottomNavigationBarItem(
          icon: GestureDetector(
            onTap: () {
              // Fetch and update weather data
              Provider.of<HomeViewModel>(context, listen: false)
                  .fetchWeatherData();
            },
            child: Icon(
              Icons.location_on,
              color: Colors.white,
            ),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WeatherScreen()),
              );
            },
            child: Icon(
              Icons.list,
              color: Colors.white,
            ),
          ),
          label: '',
        ),
      ],
    );
  }
}

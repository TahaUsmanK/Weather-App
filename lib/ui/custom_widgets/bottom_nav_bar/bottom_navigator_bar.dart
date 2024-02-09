import 'package:flutter/material.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/weather_screen/weather_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  _BottomNavBar createState() => _BottomNavBar();
}

class _BottomNavBar extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.location_on),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => WeatherScreen()));
            },
            child: Icon(Icons.list),
          ),
          label: '',
        ),
      ],
    );
  }
}

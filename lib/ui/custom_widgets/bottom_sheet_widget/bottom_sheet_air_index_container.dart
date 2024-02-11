import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';

class BottomSheetWeatherAirIndex extends StatelessWidget {
  const BottomSheetWeatherAirIndex({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GlassContainer(
          margin: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.5,
          ),
          width: MediaQuery.of(context).size.width * 0.2,
          height: 100,
          borderRadius: BorderRadius.circular(50),
          blur: 7,
          borderColor: Colors.transparent,
          alignment: Alignment.bottomCenter,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xff612FAB).withAlpha(100),
              Color(0xff612FAB).withAlpha(50),
            ],
            stops: [0.3, 1],
          ),
          borderGradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
            colors: [
              Color(0xFF4579C5).withAlpha(10),
              Color(0xff612FAB).withAlpha(0),
            ],
            stops: [0.06, 1],
          ),
        ),
        Positioned(
          top: 10,
          left: 0,
          right: 0,
          child: Center(
            child: Text(
              "12 AM",
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ),
        Positioned(
          top: 9,
          bottom: 0,
          left: 0,
          right: 0,
          child: Center(
            child: Image.asset(
              "assets/Images/rain_weather.png",
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Center(
            child: Text(
              "19°",
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

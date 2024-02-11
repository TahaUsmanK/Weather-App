import 'package:flutter/material.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/weekly_weather_widget/weekly_weather_widget.dart';
import 'package:glass_kit/glass_kit.dart';
import 'bottom_sheet_weather_forecast.dart';

class BottomSheetWeatherExpanded extends StatelessWidget {
  const BottomSheetWeatherExpanded({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Hourly Forecast",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                "Daily Forecast",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(width: 10),
          Divider(thickness: 2),
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.05,
                  ),
                  child: WeeklyWeatherWidget(),
                );
              },
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          GlassContainer(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.15,
            borderRadius: BorderRadius.circular(30),
            blur: 7,
            borderColor: Colors.transparent,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF262C51).withAlpha(100),
                Color(0xFFffffff).withAlpha(0),
                Color(0xff612FAB).withAlpha(50),
              ],
              stops: [0.3, 0.7, 1],
            ),
            borderGradient: LinearGradient(
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
              colors: [
                Color(0xFF262C51).withAlpha(100),
                Color(0xFFffffff).withAlpha(0),
                Color(0xff612FAB).withAlpha(50),
              ],
              stops: [0.3, 0.7, 1],
            ),
            child: Stack(
              children: [
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.01,
                  left: MediaQuery.of(context).size.height * 0.02,
                  child: Text(
                    "Air Quality Index",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.05,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Text(
                      "120",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

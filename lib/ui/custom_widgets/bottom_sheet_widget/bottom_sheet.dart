import 'package:flutter/material.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/bottom_sheet_widget/bottom_sheet_weather_forecast.dart';
import 'package:glass_kit/glass_kit.dart';
import 'draggable_bottom_sheet_nullsafety.dart';
import 'bottom_sheet_weather_hourly.dart';

class BottomSheets extends StatelessWidget {
  const BottomSheets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width * 0.9;

    return Stack(
      children: [
        DraggableBottomSheet(
          previewChild: Center(
            child: GlassContainer(
              width: width,
              height: MediaQuery.of(context).size.height,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              blur: 7,
              borderColor: Colors.transparent,
              alignment: Alignment.topCenter, // Aligns the previewChild on top
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xff612FAB).withAlpha(100),
                  Color(0xff612FAB).withAlpha(50),
                ],
                stops: [0.3, 1],
              ),
              child: WeatherHourlyDaily(),
            ),
          ),
          expandedChild: GlassContainer(
            width: width,
            height: MediaQuery.of(context).size.height,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            blur: 5,
            borderColor: Colors.transparent,
            alignment: Alignment.topCenter, // Aligns the expandedChild on top
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              colors: [
                Color(0xff612FAB).withAlpha(100),
                Color(0xff612FAB).withAlpha(50),
              ],
              stops: [0.3, 1],
            ),
            child: BottomSheetWeather(),
          ),
          minExtent: 180,
          maxExtent: MediaQuery.of(context)
              .size
              .height, // Occupies entire screen height
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            color: Colors.black, // Adjust color as needed
            child: TabBar(
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
            ),
          ),
        ),
      ],
    );
  }
}

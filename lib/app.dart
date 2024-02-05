import 'package:flutter/material.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/weather_screen/weather_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  final String title;

  static const double _designWidth = 375;
  static const double _designHeight = 812;
  const MyApp({required this.title, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(_designWidth, _designHeight),
      builder: (context, widget) => MaterialApp(
        title: title,
        home: WeatherScreen(),
      ),
    );
  }
}

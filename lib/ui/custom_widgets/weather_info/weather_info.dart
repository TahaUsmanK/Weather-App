import 'package:flutter/material.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/home_screen/home_screen_view_model.dart';
import 'package:provider/provider.dart';

class WeatherInfoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<HomeViewModel>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'City: ${viewModel.city}',
          style: TextStyle(color: Colors.white),
        ),
        Text(
          'Temperature: ${viewModel.currentTemperature}°C',
          style: TextStyle(color: Colors.white),
        ),
        Text(
          'Description: ${viewModel.weatherDescription}',
          style: TextStyle(color: Colors.white),
        ),
        Row(
          children: [
            Text(
              'High: ${viewModel.maxTemperature}°C',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(width: 10),
            Text(
              'Low: ${viewModel.minTemperature}°C',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ],
    );
  }
}

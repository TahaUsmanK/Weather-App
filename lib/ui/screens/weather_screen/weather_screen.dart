import 'package:flutter/material.dart';
import 'package:flutter_antonx_boilerplate/core/models/responses/base_responses/request_response.dart';
import 'package:flutter_antonx_boilerplate/core/services/api_services.dart';
import 'package:flutter_antonx_boilerplate/core/services/location_service.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final ApiServices apiServices = ApiServices();
  final LocationService locationService = LocationService();
  late Future<Map<String, dynamic>?> _locationFuture;

  @override
  void initState() {
    super.initState();
    _locationFuture = locationService.getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _locationFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return Center(child: Text('No location data available.'));
          } else {
            var locationData = snapshot.data as Map<String, dynamic>;

            return FutureBuilder(
              future: apiServices.getWeather(
                latitude: locationData['latitude'] ?? 0.0,
                longitude: locationData['longitude'] ?? 0.0,
              ),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  var jsonList = (snapshot.data as RequestResponse).data;

                  return ListView.builder(
                    itemCount: 1,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          ListTile(
                            title: Text(jsonList?['cloud_pct'].toString() ??
                                'Cloud Percentage'),
                            subtitle: Text(
                              jsonList?['temp'].toString() ?? 'Temperature',
                            ),
                          ),
                          ListTile(
                            title: Text(jsonList?['feels_like'].toString() ??
                                'Feels Like'),
                            subtitle: Text(
                              jsonList?['humidity'].toString() ?? 'Humidity',
                            ),
                          ),
                          ListTile(
                            title: Text(
                                jsonList?['min_temp'].toString() ?? 'Min Temp'),
                            subtitle: Text(
                              jsonList?['max_temp'].toString() ?? 'Max Temp',
                            ),
                          ),
                          ListTile(
                            title: Text(jsonList?['wind_speed'].toString() ??
                                'Wind Speed'),
                            subtitle: Text(
                              jsonList?['wind_degrees'].toString() ??
                                  'Wind Degrees',
                            ),
                          ),
                          ListTile(
                            title: Text(
                                jsonList?['sunrise'].toString() ?? 'Sunrise'),
                            subtitle: Text(
                              jsonList?['sunset'].toString() ?? 'Sunset',
                            ),
                          ),
                          ListTile(
                            title: Text(''),
                            subtitle: Text(
                              '${locationData['latitude'] ?? 'Latitude'} - ${locationData['longitude'] ?? 'Longitude'}',
                            ),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
            );
          }
        },
      ),
    );
  }
}

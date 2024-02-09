import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

Future<Position?> getCurrentLocation() async {
  bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    print('Location services are disabled.');
    return null;
  }

  LocationPermission permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return null;
    }
  }
  if (permission == LocationPermission.deniedForever) {
    return null;
  }

  return await Geolocator.getCurrentPosition();
}

Future<String> getCityName(Position position) async {
  final List<Placemark> placemarks = await placemarkFromCoordinates(
    position.latitude,
    position.longitude,
  );
  if (placemarks.isNotEmpty) {
    final Placemark placemark = placemarks.first;
    return placemark.locality ?? 'Unknown';
  } else {
    return 'Unknown';
  }
}

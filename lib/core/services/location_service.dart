import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:logger/logger.dart';

class LocationService {
  Position? currentLocation;
  final Logger log = Logger();

  Future<String> getCity() async {
    try {
      if (await checkNotificationPermission()) {
        List<Placemark> placemarks = await GeocodingPlatform.instance
            .placemarkFromCoordinates(
                currentLocation!.latitude, currentLocation!.longitude);
        if (placemarks.isNotEmpty) {
          return placemarks.first.locality ?? '';
        }
      }
      return '';
    } catch (e) {
      log.e('$e');
      return '';
    }
  }

  Future<Map<String, dynamic>?> getCurrentLocation() async {
    try {
      await checkNotificationPermission();

      if (currentLocation == null) {
        currentLocation = await Geolocator.getCurrentPosition();
      }
      return {
        'latitude': currentLocation!.latitude,
        'longitude': currentLocation!.longitude,
        'city': await getCity(),
      };
    } catch (e) {
      log.e('$e');
      return null;
    }
  }

  Future<bool> checkNotificationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      await Permission.location.request();
      return false;
    }
    return true;
  }
}

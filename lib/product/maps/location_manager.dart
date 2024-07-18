import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sezin_soft/product/core/models/latlong.dart';

final class LocationManager {
  LocationManager._init();

  static Future<Position?> getLocation() async {
    final permission = await _determinePosition();
    if (!permission) return null;
    final position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    return position;
  }

  static Future<bool> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return false;
    }

    return true;
  }

  static Future<String?>? addressFromLatLong(LatLong? latLong) async {
    if (latLong?.latitude == null || latLong?.longitude == null) return null;
    final response = await placemarkFromCoordinates(
      latLong!.latitude!,
      latLong.longitude!,
    );
    final address = response.first;
    return '${address.subLocality} ${address.thoroughfare} ${address.subAdministrativeArea} ${address.administrativeArea}/${address.country} ';
  }
}

import 'package:location/location.dart';

class LocationService {
  Location location = Location();

  Future<void> checkAndEnsureLocationService() async {
    bool isServiceEnabled = await location.serviceEnabled();
    if (!isServiceEnabled) {
      isServiceEnabled = await location.requestService();
      if (!isServiceEnabled) {
        throw LocationServiveException();
      }
    }
  }

  Future<void> checkAndEnsureLocationPermission() async {
    PermissionStatus isServicehasPermission = await location.hasPermission();
    if (isServicehasPermission == PermissionStatus.deniedForever) {
      throw LocationPermissionException();
    } else if (isServicehasPermission == PermissionStatus.denied) {
      isServicehasPermission = await location.requestPermission();
      if (isServicehasPermission != PermissionStatus.granted) {
        throw LocationPermissionException();
      }
    }
  }

  streamMyLocation({required void Function(LocationData)? onData}) async {
    await checkAndEnsureLocationService();
    await checkAndEnsureLocationPermission();
    location.changeSettings(
      distanceFilter: 2,
    );
    location.onLocationChanged.listen(onData);
  }

  Future<LocationData> getMyLocation() async {
    await checkAndEnsureLocationService();
    await checkAndEnsureLocationPermission();
    return await location.getLocation();
  }
}

class LocationServiveException implements Exception {}

class LocationPermissionException implements Exception {}

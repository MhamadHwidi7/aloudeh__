import 'package:get/get.dart';
import 'package:location/location.dart';

class LocationController extends GetxController {
  final Location _locationService = Location();
  LocationData? _currentLocation;

  @override
  void onInit() {
    super.onInit();
    _fetchCurrentLocation();
  }

  void _fetchCurrentLocation() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await _locationService.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await _locationService.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await _locationService.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _locationService.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _currentLocation = await _locationService.getLocation();
    _locationService.onLocationChanged.listen((LocationData loc) {
      _currentLocation = loc;
      update();
    });
  }
}

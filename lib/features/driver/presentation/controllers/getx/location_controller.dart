import 'package:get/get.dart';
import 'package:location/location.dart';
import 'dart:async';

class LocationController extends GetxController {
  final Location _locationService = Location();
  LocationData? currentLocation;
  bool isFetchingLocation = false;
  final Completer<void> _initialLocationFetchCompleter = Completer<void>();

  @override
  void onInit() {
    super.onInit();
    _fetchCurrentLocation();
  }

  Future<void> _fetchCurrentLocation() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    isFetchingLocation = true;
    update();

    // Check if the location service is enabled
    serviceEnabled = await _locationService.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await _locationService.requestService();
      if (!serviceEnabled) {
        print('Location service is not enabled');
        isFetchingLocation = false;
        update();
        _initialLocationFetchCompleter.complete();
        return;
      }
    }

    // Check if the location permission is granted
    permissionGranted = await _locationService.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await _locationService.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        print('Location permission is not granted');
        isFetchingLocation = false;
        update();
        _initialLocationFetchCompleter.complete();
        return;
      }
    }

    try {
      // Get the current location
      currentLocation = await _locationService.getLocation();
      print('Current Location: $currentLocation');
      update();  // Notify listeners to update

      // Complete the completer to signal that the initial fetch is done
      _initialLocationFetchCompleter.complete();

      // Listen to location changes
      _locationService.onLocationChanged.listen((LocationData loc) {
        currentLocation = loc;
        print('Updated Current Location: $currentLocation');
        update();  // Notify listeners to update
      });
    } catch (e) {
      print('Error fetching location: $e');
      _initialLocationFetchCompleter.complete();
    } finally {
      isFetchingLocation = false;
      update();
    }
  }

  Future<void> get initialLocationFetchCompleted => _initialLocationFetchCompleter.future;
}

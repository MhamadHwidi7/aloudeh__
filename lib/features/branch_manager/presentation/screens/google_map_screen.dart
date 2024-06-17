import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? _controller;
  LatLng _currentPosition = LatLng(37.4219999, -122.0840575);
  Marker? _marker;
  bool _permissionDenied = false;

  @override
  void initState() {
    super.initState();
    _checkPermissionAndFetchLocation();
  }

  Future<void> _checkPermissionAndFetchLocation() async {
    if (await _handleLocationPermission()) {
      _getCurrentLocation();
    } else {
      setState(() {
        _permissionDenied = true;
      });
    }
  }

  Future<bool> _handleLocationPermission() async {
    var status = await Permission.locationWhenInUse.status;
    if (status.isGranted) {
      return true;
    } else if (status.isDenied) {
      status = await Permission.locationWhenInUse.request();
      return status.isGranted;
    }
    return false;
  }

  Future<void> _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      setState(() {
        _currentPosition = LatLng(position.latitude, position.longitude);
      });
      _controller?.animateCamera(CameraUpdate.newLatLng(_currentPosition));
    } catch (e) {
      print("Error getting location: $e");
    }
  }

  void _onMapTapped(LatLng position) {
    setState(() {
      _marker = Marker(
        markerId: MarkerId('selected-location'),
        position: position,
      );
    });
    print('Marker placed at: ${position.latitude}, ${position.longitude}');
  }

  Widget _buildMap() {
    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: _currentPosition,
        zoom: 14.0,
      ),
      myLocationEnabled: true,
      myLocationButtonEnabled: false,
      onMapCreated: (GoogleMapController controller) {
        _controller = controller;
        _getCurrentLocation();
      },
      markers: _marker != null ? {_marker!} : {},
      onTap: _onMapTapped,
    );
  }

  Widget _buildPermissionDeniedMessage() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Location permissions are denied. Please enable permissions in settings.'),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () async {
              await openAppSettings();
            },
            child: Text('Open Settings'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _permissionDenied ? _buildPermissionDeniedMessage() : _buildMap(),
      floatingActionButton: _permissionDenied
          ? null
          : FloatingActionButton(
              onPressed: _getCurrentLocation,
              child: Icon(Icons.my_location),
            ),
    );
  }
}

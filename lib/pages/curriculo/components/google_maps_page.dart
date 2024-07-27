import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:seujobapp/services/location_service.dart';

class GoogleMapsPage extends StatefulWidget {
  const GoogleMapsPage({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _GoogleMapsPageState();
}

/// A widget that displays a Google Map.
class _GoogleMapsPageState extends State<GoogleMapsPage> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  Position? _position;

  void getLocation() async {
    LocationService locationService = LocationService();
    Position? position = await locationService.getCurrentPosition();
    setState(() {
      _position = position;
    });
  }

  @override
  Widget build(BuildContext context) {
    getLocation();
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Maps'),
      ),
      body: (_position == null)
          ? Text("Carregando")
          : GoogleMap(
              initialCameraPosition: CameraPosition(
                target:
                    LatLng(_position!.latitude, _position!.longitude), // Coordinates for San Francisco
                zoom: 10,
              ),
              // Additional map options can be added here
            ),
    );
  }
}

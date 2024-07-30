import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:seujobapp/services/geocoder_service.dart';
import 'package:seujobapp/services/location_service.dart';

import '../../../utils/app_routes.dart';

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

  Placemark? address;

  bool loading = false;

  void getLocation() async {
    LocationService locationService = LocationService();
    Position? position = await locationService.getCurrentPosition();
    _getAddress(position!.latitude, position.longitude);
    setState(() {
      _position = position;
    });
  }

  void _getAddress(double latitude, double longitude) async {
    setState(() {
      loading = true;
    });
    GeocoderService geocoderService = GeocoderService();
    Placemark? address = await geocoderService.getAddressFromCoordinates(latitude, longitude);
    print(address);
    setState(() {
      this.address = address;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext t) {
    if (_position == null) {
      getLocation();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Selecione sua localização:'),
      ),
      body: Column(
        children: [
          Expanded(
              child: Container(
                child: (_position == null)
                    ? Text("Carregando")
                    : GoogleMap(
                    onTap: (LatLng latLng) {
                      Position position = Position(
                          longitude: latLng.longitude,
                          latitude: latLng.latitude,
                          timestamp: _position!.timestamp,
                          accuracy: _position!.accuracy,
                          altitude: _position!.altitude,
                          heading: _position!.heading,
                          speed: _position!.speed,
                          speedAccuracy: _position!.speedAccuracy);
                      _getAddress(position.latitude, position.longitude);
                      setState(() {
                        _position = position;
                      });
                    },
                    initialCameraPosition: CameraPosition(
                      target:
                      LatLng(_position!.latitude, _position!.longitude), // Coordinates for San Francisco
                      zoom: 10,
                    ),
                    markers: {
                      Marker(
                        markerId: MarkerId("1"),
                        position: LatLng(_position!.latitude, _position!.longitude),
                        infoWindow: InfoWindow(
                          title: "Você está aqui",
                          snippet: "Sua localização atual",
                        ),
                      ),
                    }
                  // Additional map options can be added here
                ),
              )
          ),
          Container(
            padding: EdgeInsets.all(10),
            width: double.infinity,
            color: Colors.lightBlueAccent,
            child: Text(
                      "Endereço selecionado:",
                      style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                      ),
            ),
          ),
          Container(
            height: 100,
            width: double.infinity,
            alignment: Alignment.center,
            child: (loading)
                ?
                CircularProgressIndicator()
                :
                (address == null)
                ?
                Text("Selecione um endereço no mapa")
                :
                GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 4,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Text("Rua: ${address!.thoroughfare}", style: TextStyle(fontSize: 15),),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      child: Text("Cidade: ${address!.subAdministrativeArea}", style: TextStyle(fontSize: 15),),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Text("CEP: ${address!.postalCode}", style: TextStyle(fontSize: 15),),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Text("País: ${address!.country}", style: TextStyle(fontSize: 15),),
                    ),
                  ],
                ),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.PERFIL, arguments: address);
              },
              child: Text("Confirmar endereço")
          )
        ],
      )
    );
  }
}

import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GeocoderService {
  Placemark? endereco;
  /// Converts an address to coordinates (latitude and longitude).
  Future<LatLng?> getCoordinatesFromAddress(String address) async {
    try {
      List<Location> locations = await locationFromAddress(address);
      if (locations.isNotEmpty) {
        return LatLng(locations.first.latitude, locations.first.longitude);
      }
    } catch (e) {
      print('Error occurred while getting coordinates: $e');
    }
    return null;
  }

  /// Converts coordinates (latitude and longitude) to an address.
  Future<Placemark?> getAddressFromCoordinates(double latitude, double longitude) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(latitude, longitude);
      if (placemarks.isNotEmpty) {
        return placemarks.first;
      }
    } catch (e) {
      print('Error occurred while getting address: $e');
    }
    return null;
  }
}
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({
    Key? key,
    required this.street,
    required this.number,
    required this.city,
    required this.state,
    required this.country,
  }) : super(key: key);

  final String street;
  final String number;
  final String city;
  final String state;
  final String country;

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng? _targetLocation;

  @override
  void initState() {
    super.initState();
    _loadTargetLocation();
  }

  Future<void> _loadTargetLocation() async {
    final coordinates = await getCoordinatesFromAddress(
      widget.street,
      widget.number,
      widget.city,
      widget.state,
      widget.country,
    );

    if (coordinates != null) {
      setState(() {
        _targetLocation = coordinates;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mapa'),
      ),
      body: GoogleMap(
        onMapCreated: (controller) {},
        initialCameraPosition: CameraPosition(
          target: _targetLocation ?? const LatLng(0, 0),
          zoom: _targetLocation != null ? 15.0 : 1.0,
        ),
        markers: _targetLocation != null
            ? {
                Marker(
                  markerId: const MarkerId("1"),
                  position: _targetLocation!,
                  infoWindow: const InfoWindow(
                    title: "Localização",
                  ),
                ),
              }
            : {},
      ),
    );
  }

  Future<LatLng?> getCoordinatesFromAddress(String street, String number,
      String city, String state, String country) async {
    const apiKey = 'AIzaSyA_6cK3u2Mx7mGKpG_E9Bzc2esRzn8DhUI';
    final address = '$street $number, $city, $state, $country';
    final response = await http.get(Uri.parse(
        'https://maps.googleapis.com/maps/api/geocode/json?address=$address&key=$apiKey'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['status'] == 'OK' &&
          data['results'] is List &&
          data['results'].isNotEmpty) {
        final location = data['results'][0]['geometry']['location'];

        return LatLng(location['lat'], location['lng']);
      }
    }
    return null;
  }
}

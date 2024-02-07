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
    required this.latitude,
    required this.longitude,
  }) : super(key: key);

  final String street;
  final String number;
  final String city;
  final String state;
  final String country;
  final double latitude;
  final double longitude;

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
    if (widget.latitude != 0 && widget.longitude != 0) {
      print(widget.latitude);
      print(widget.longitude);
      setState(() {
        _targetLocation = LatLng(widget.latitude, widget.longitude);
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
                Marker(
                  markerId: const MarkerId("2"),
                  position: LatLng(widget.latitude, widget.longitude),
                  infoWindow: const InfoWindow(
                    title: "Lixeira",
                  ),
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueRed,
                  ),
                ),
              }
            : {},
      ),
    );
  }
}

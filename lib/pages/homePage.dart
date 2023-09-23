import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late LatLng _userLocation = const LatLng(0, 0); // Default location
  GeolocatorPlatform geoLocator = GeolocatorPlatform.instance;

  final List<Marker> _markers = [];
  @override
  void initState() {
    _initUserLocation();
    _initMarkers(); // Initialize custom markers
    super.initState();
  }

  Future<void> _initUserLocation() async {
    Position position = await geoLocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    setState(() {
      _userLocation = LatLng(position.latitude, position.longitude);
    });
  }

  void _initMarkers() async {
    FirebaseFirestore.instance.collection('locations').get().then((querySnapshot) async {
      Position userPosition = await geoLocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      double maxDistance = 1000; // 1 km in meters

      querySnapshot.docs.forEach((doc) {
        double latitude = doc['latitude'];
        double longitude = doc['longitude'];
        double distance = geoLocator.distanceBetween(
          userPosition.latitude,
          userPosition.longitude,
          latitude,
          longitude,
        );

        if (distance <= maxDistance) {
          setState(() {
            _markers.add(
              Marker(
                width: 30.0,
                height: 30.0,
                point: LatLng(latitude, longitude),
                builder: (ctx) => IconButton(
                  icon: const Icon(Icons.location_on),
                  color: Colors.red,
                  iconSize: 30.0,
                  onPressed: () {
                    // Handle marker tap here
                    _showMarkerPopup('Marker 1');
                  },
                ),
              ),
            );
          });
        }
      });
    });
  }


  void _showMarkerPopup(String markerTitle) {
    // Show a popup for the tapped marker
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(markerTitle),
          content: const Text("This is a custom marker popup."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_userLocation == const LatLng(0, 0)) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: FlutterMap(
              options: MapOptions(
                center: _userLocation,
                zoom: 13.0,
              ),
              children: [
                TileLayer(
                  urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: const ['a', 'b', 'c'],
                ),
                MarkerLayer(
                  markers: [
                    // Add the user's location marker
                    Marker(
                      width: 30.0,
                      height: 30.0,
                      point: _userLocation,
                      builder: (ctx) => const Icon(
                        Icons.location_pin,
                        color: Colors.blue,
                        size: 30.0,
                      ),
                    ),

                    ..._markers,
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
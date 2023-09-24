import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:smart_india_hackathon/services/agencyServices.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late LatLng _userLocation = const LatLng(0, 0);
  GeolocatorPlatform geoLocator = GeolocatorPlatform.instance;
  AgencyDatabase agencyDatabase = AgencyDatabase();

  final List<Marker> _markers = [];

  @override
  void initState() {
    super.initState();
    _initUserLocation();
    _initMarkers();
  }

  Future<void> _initUserLocation() async {
    Position position = await geoLocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    setState(() {
      _userLocation = LatLng(position.latitude, position.longitude);
    });
  }

  Future<void> _initMarkers() async {
    try {
      Position userPosition = await geoLocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      double maxDistance = 3000;

      final markerTypes = [
        {'type': 'FireStation', 'icon': Icons.local_fire_department},
        {'type': 'Medical', 'icon': Icons.local_hospital},
        {'type': 'PoliceStation', 'icon': Icons.local_police},
        {'type': 'RTO', 'icon': Icons.traffic},
      ];

      for (final markerType in markerTypes) {
        QuerySnapshot querySnapshot = await FirebaseFirestore.instance
            .collection('Agency')
            .doc(markerType['type'] as String?)
            .collection('Hinjewadi')
            .get();

        querySnapshot.docs.forEach((doc) {
          if (doc.exists) {
            String locationString = doc['location'];

            List<String> locationParts = locationString.split(',');

            if (locationParts.length == 2) {
              double latitude = double.parse(locationParts[0]);
              double longitude = double.parse(locationParts[1]);

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
                        icon: Icon(markerType['icon'] as IconData?),
                        color: Colors.red,
                        iconSize: 30.0,
                        onPressed: () {
                          String locationName = doc['name'];
                          String id = doc['id'];
                          _showMarkerPopup(locationName, id);
                        },
                      ),
                    ),
                  );
                });
              }
            }
          }
        });
      }
    } catch (error) {
      print("Error fetching Firestore data: $error");
    }
  }

  void _showMarkerPopup(String markerTitle, String id) async {
    Map<String, dynamic> data = await agencyDatabase.getAgency(id: id);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(markerTitle),
          content: SingleChildScrollView(
            child: Column(
              children: [
                const Text('Address:'),
                Text(data["address"]),
                const SizedBox(height: 10),
                const Text('Description:'),
                Text(data["description"]),
                const SizedBox(height: 10),
                const Text('ID:'),
                Text(data["id"]),
                const SizedBox(height: 10),
                const Text('Location:'),
                Text(data["location"]),
                const SizedBox(height: 10),
                const Text('Name:'),
                Text(data["name"]),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
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
                zoom: 14.0,
                maxZoom: 18.0,
              ),
              children: [
                TileLayer(
                  urlTemplate:
                  "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
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

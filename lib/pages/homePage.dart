import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:smart_india_hackathon/pages/agencydetail_Page.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late LatLng _userLocation = const LatLng(0, 0);
  GeolocatorPlatform geoLocator = GeolocatorPlatform.instance;

  final List<Marker> _markers = [];
  @override
  void initState() {
    _initUserLocation();
    _initMarkers();
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
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('Agency')
          .doc('FireStation')
          .collection('Hinjewadi-phase-1')
          .get();

      Position userPosition = await geoLocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      double maxDistance = 1000;

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
                      icon: const Icon(Icons.local_fire_department),
                      color: Colors.red,
                      iconSize: 30.0,
                      onPressed: () {
                        String locationName= doc['name'];
                        String locationId= doc['locationId'];
                        _showMarkerPopup(locationName,locationId);

                      },
                    ),
                  ),
                );
              });
            }
          }
        }
      });
    } catch (error) {
      print("Error fetching Firestore data: $error");
    }
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('Agency')
          .doc('Medical')
          .collection('Hinjewadi')

          .get();

      Position userPosition = await geoLocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      double maxDistance = 1000;

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
                      icon: const Icon(Icons.local_hospital),
                      color: Colors.red,
                      iconSize: 30.0,
                      onPressed: () {
                        String locationName= doc['name'];
                        String locationId= doc['locationId'];
                        _showMarkerPopup(locationName,locationId);
                      },
                    ),
                  ),
                );
              });
            }
          }
        }
      });

    } catch (error) {
      print("Error fetching Firestore data: $error");
    }try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('Agency')
          .doc('RTO')
          .collection('RTOs')

          .get();

      Position userPosition = await geoLocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      double maxDistance = 1000;

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
                      icon: const Icon(Icons.traffic),
                      color: Colors.red,
                      iconSize: 30.0,
                      onPressed: () {
                        String locationName= doc['name'];
                        String locationId= doc['locationId'];
                        _showMarkerPopup(locationName,locationId);
                      },
                    ),
                  ),
                );
              });
            }
          }
        }
      });
    } catch (error) {
      print("Error fetching Firestore data: $error");
    }
  }

  void _showMarkerPopup(String markerTitle, String locationId) {
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
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _navigateToOtherPage(locationId);
              },
              child: const Text('Go to Details Page'),
            ),
          ],
        );
      },
    );
  }

  void _navigateToOtherPage(String locationId) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AgencyDetail(locationId),
      ),
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
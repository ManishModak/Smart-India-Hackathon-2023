import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AgencyDetailPage extends StatefulWidget {
  final String locationId;

  AgencyDetailPage(this.locationId);

  @override
  _AgencyDetailPageState createState() => _AgencyDetailPageState();
}

class _AgencyDetailPageState extends State<AgencyDetailPage> {
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    try {
      // Reference to the Firestore collection
      CollectionReference agencies = FirebaseFirestore.instance
          .collection('Agency')
          .doc('Medical')
          .collection('Hinjewadi');

      // Query to filter documents where locationId matches
      QuerySnapshot querySnapshot = await agencies
          .where('locationId', isEqualTo: widget.locationId)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        // Iterate through the documents and print data
        querySnapshot.docs.forEach((doc) {
          var data = querySnapshot.docs.first.data() as Map<String, dynamic>;
          print('Agency Name: ${data['name']}');
          print('Agency Description: ${data['agencyDescription']}');
        });
      } else {
        print('No data found for locationId: ${widget.locationId}');
      }
    } catch (error) {
      print('Error fetching Firestore data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agency Detail'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Location ID: ${widget.locationId}',
              style: const TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}

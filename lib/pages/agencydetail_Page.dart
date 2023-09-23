import 'package:flutter/material.dart';

class AgencyDetail extends StatelessWidget {
  final String agencyName;
  final String location;
  final String phone;
  final String email;
  final String about;

  AgencyDetail({
    required this.agencyName,
    required this.location,
    required this.phone,
    required this.email,
    required this.about,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agency Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Text(
                agencyName,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: Text(
                'Location: $location',
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(height: 38),
            const Center(
              child: Text(
                'Contact Information:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: Text(
                'Phone: $phone',
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            Center(
              child: Text(
                'Email: $email',
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(height: 44),
            const Center(
              child: Text(
                'About the Agency',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: Text(
                about,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

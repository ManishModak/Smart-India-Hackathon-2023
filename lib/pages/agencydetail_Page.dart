import 'package:flutter/material.dart';

class AgencyDetail extends StatefulWidget {
  const AgencyDetail(String locationId, {super.key});

  @override
  State<AgencyDetail> createState() => _AgencyDetailState();
}

class _AgencyDetailState extends State<AgencyDetail> {

  TextEditingController agencyName = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController about = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agency Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Center(
              child: Text(
                "agencyName.text",
                style: TextStyle(
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
            const SizedBox(height: 44),
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
            const Center(
              child: Text(
                'about.text',
                style: TextStyle(
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


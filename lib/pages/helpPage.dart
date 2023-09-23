import 'package:flutter/material.dart';

class Help extends StatelessWidget {
  const Help({super.key, Key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Urgent Response'),
        centerTitle: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Emergency Helpline',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Dial 100 for immediate assistance.',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 24),
            Text(
              'Other Contacts',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Police: 100'),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Fire: 101'),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Medical: 112'),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Help extends StatelessWidget {
  const Help({super.key});

  void _showAboutUsPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('About Us'),
          content: const SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8),
                Text('Welcome to [Your App Name], a revolutionary platform dedicated to enhancing disaster response and recovery '
                    'efforts worldwide. We are passionate about making a positive impact during times of crisis and emergency, and'
                    ' our commitment to improving the coordination and effectiveness of rescue agencies drives our work. Our mission '
                    'is simple yet powerful: to create a centralized hub that connects rescue agencies, empowers them with the information '
                    'they need, and facilitates seamless collaboration in the face of disasters.',
                  style: TextStyle(fontSize: 16),
                ),
                // Add more text or widgets as needed.
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the popup.
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void _contactdetailsPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Contact details:'),
          content: const SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8),
                Text('Email    : abc@gmail.com',
                  style: TextStyle(fontSize: 16),
                ),
                Text('Phone  : 3586328650', style: TextStyle(fontSize: 16),)
                // Add more text or widgets as needed.
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the popup.
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
    return Scaffold(
        appBar: AppBar(
          title: const Text('Help'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                onPressed: () {

                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  minimumSize: const Size(300, 60),
                ),
                child: const Text('Tutorial'),
              ),
              const SizedBox(
                height: 20, // Adjust the height for the desired spacing
              ),
              ElevatedButton(
                onPressed: () {
                  _showAboutUsPopup(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  minimumSize: const Size(300, 60),
                ),
                child: const Text('About Us'),
              ),
              const SizedBox(
                height: 20, // Adjust the height for the desired spacing
              ),
              ElevatedButton(
                onPressed: () {
                  _contactdetailsPopup(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  minimumSize: const Size(300, 60),
                ),
                child: const Text('Contact Details'),
              ),
              const SizedBox(
                height: 20, // Adjust the height for the desired spacing
              ),
              ElevatedButton(
                onPressed: () {

                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  minimumSize: const Size(300, 60),
                ),
                child: const Text('Feedback'),
              ),
            ],
          ),
        )
    );
  }
}

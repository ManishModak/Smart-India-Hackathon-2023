import 'package:flutter/material.dart';
import 'package:smart_india_hackathon/services/agencyServices.dart';

class ResourcesPage extends StatefulWidget {
  final String agencyId;

  const ResourcesPage({Key? key, required this.agencyId}) : super(key: key);

  @override
  State<ResourcesPage> createState() => _ResourcesPageState();
}

class _ResourcesPageState extends State<ResourcesPage> {
  AgencyDatabase agencyDatabase = AgencyDatabase();
  Map<String, dynamic> data = {};

  TextEditingController name = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController about = TextEditingController();

  @override
  void initState() {
    super.initState();
    getInfo();
  }

  Future<void> getInfo() async {
    data = await agencyDatabase.getAgency(id: widget.agencyId);

    // Update the text controllers with the fetched data
    name.text = data["name"];
    address.text = data["address"];
    phone.text = data["phone"];
    about.text = data["description"];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Resources')),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Agency Name
            const Text(
              "Agency Name:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(name.text),
            const SizedBox(height: 16.0),

            // Agency No
            const Text(
              "Agency No:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(phone.text),
            const SizedBox(height: 16.0),

            // Agency Address
            const Text(
              "Agency Address:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(address.text),
            const SizedBox(height: 16.0),

            // Agency Description
            const Text(
              "Agency Description:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(about.text),
          ],
        ),
      ),
    );
  }
}

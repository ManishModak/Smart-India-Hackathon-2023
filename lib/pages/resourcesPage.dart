import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Text(
                    "Agency Name:",
                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                  ),
                  Icon(FontAwesomeIcons.penToSquare)
                ],
              ),
              const SizedBox(height: 10.0),
              Text(name.text),
              const SizedBox(height: 19.0),


              const Text(
                "Agency Phone No:",
                style: TextStyle(fontSize:20 ,fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10.0),
              Text(phone.text),
              const SizedBox(height: 19.0),

              const Text(
                "Agency Address:",
                style: TextStyle(fontSize:20,fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10.0),
              Text(address.text),
              const SizedBox(height: 19.0),

              // Agency Description
              const Text(
                "Agency Description:",
                style: TextStyle(fontSize:20,fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              Text(about.text),
            ],
          ),
        ),
      ),
    );
  }
}

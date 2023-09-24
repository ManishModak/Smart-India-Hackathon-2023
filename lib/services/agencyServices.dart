import 'authServices.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AgencyDatabase{

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final LoginDatabase _loginDatabase = LoginDatabase();

  Future<void> addAgency({required String id, required String pass,
    required String name, required String type,
    required String address, required String location, required locationID,
    required String description}) async {

    await _firestore.collection("Agency").doc(type).collection("Hinjewadi").doc(id).set({
      "id" : id,
      "name" : name,
      "location" : location,
      "locationID" : locationID,
      "address" : address,
      "description" : description
    });

    _loginDatabase.addUser(id: id, pass: pass);
  }

  Future<Map<String, dynamic>> getAgency({required id}) async {

    QuerySnapshot querySnapshot = await _firestore.collection("Agency").get();
    Map<String ,dynamic> data = {};
    for (var type in querySnapshot.docs) {
      QuerySnapshot agencies = await type.get("${type.id} + s");
      for (var agency in agencies.docs) {
        data = agency.data() as Map<String, dynamic>;
        if (data["id"] == id) {
          return data;
        }
      }
    }
    return data;
  }

}

import 'dart:math';

import 'package:flutter/foundation.dart';

import 'authServices.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AgencyDatabase {

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final LoginDatabase _loginDatabase = LoginDatabase();

  Future<bool> isIDPresent({required String id}) async {
    List<String> types = ["FireStation", "PoliceStation", "Medical", "RTO"];

    for (var type in types) {

      CollectionReference collectionReference = _firestore.collection("Agency").doc(type).collection("Hinjewadi");
      QuerySnapshot querySnapshot = await collectionReference.get();

      for (var agency in querySnapshot.docs) {
        if (agency.id == id) {
          return true;
        }
      }
    }
    return false;
  }

  Future<String> _generateID() async {
    String id;

    do {
      final random = Random();
      const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
      const numbers = '0987654321';
      final stringBuffer = StringBuffer();

      // Generate a random alphabet character.
      stringBuffer.write(characters[random.nextInt(26)]);

      // Generate random number characters.
      for (var i = 1; i < 5; i++) {
        stringBuffer.write(numbers[random.nextInt(10)]);
      }

      id = stringBuffer.toString();

    } while (await isIDPresent(id: id));
    return id;
  }

  Future<void> addAgency({required String pass,
    required String name, required String type,
    required String address, required String location,
    required String description}) async {

    String id = await _generateID();

    await _firestore.collection("Agency").doc(type).collection("Hinjewadi").doc(id).set({
      "id" : id,
      "name" : name,
      "location" : location,
      "address" : address,
      "description" : description
    });

    _loginDatabase.addUser(id: id, pass: pass);
  }


  Future<Map<String, dynamic>> getAgency({required id}) async {

    if (await isIDPresent(id: id)) {

      List<String> types = ["FireStation", "PoliceStation", "Medical", "RTO"];

      for (var type in types) {

        CollectionReference collectionReference = _firestore.collection("Agency").doc(type).collection("Hinjewadi");
        QuerySnapshot querySnapshot = await collectionReference.get();

        for (var agency in querySnapshot.docs) {
          if (agency.id == id) {
            return agency.data() as Map<String, dynamic>;
          }
        }
      }
    }
    return {};
  }
}

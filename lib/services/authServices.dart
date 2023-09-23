import "package:cloud_firestore/cloud_firestore.dart";

class LoginDatabase {

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> addUser({required String id, required String pass}) async {

    await _firestore.collection("Users").doc(id).set({
      "id" : id,
      "password" : pass
    });

    if (await _isValidID(id: id)) { return true; }
    else { return false; }
  }

  Future<bool> _isValidID({required String id}) async {
    return (await _firestore.collection("Users").doc(id).get()).exists;
  }

  Future<bool> _isValidPass({required String id, required String pass}) async {
    DocumentSnapshot documentSnapshot = await _firestore.collection("Users").doc(id).get();
    Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;
    return (data["password"] == pass);
  }

  /// Return values meaning:
  /// 1- Login Successfully
  /// 2- Password is wrong
  /// 3- User id is wrong

  Future<int> isValidUser({required String id, required String pass}) async {
    if (!(await _isValidID(id: id))) { return 3; }
    else if (!(await _isValidPass(id: id, pass: pass))) {return 2; }
    else { return 1; }
  }

  /// Return values meaning:
  /// 1- Deleted Successfully
  /// 2- Password is wrong
  /// 3- User id is wrong

  Future<int> deleteUser({required String id, required String pass}) async {
    int validationStatus = await isValidUser(id: id, pass: pass);

    if (validationStatus == 1) {
      await _firestore.collection("Users").doc(id).delete();
    }
    return validationStatus;
  }

  //Future<bool> updatePass
}
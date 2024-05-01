import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseRemoteDatasource {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllRooms() {
    return firestore.collection('rooms').snapshots();
  }
}

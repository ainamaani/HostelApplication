import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proj/models/hostel.dart';

class FirestoreService {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> submitDetails(Hostel hostel) {
    return _db.collection('Hostelss').doc(hostel.hostelId).set(hostel.toMap());
  }

  //  static Stream<List<Hostel>> read() {
  //   final hostelCollection = FirebaseFirestore.instance.collection('Hostelss');
  //   return hostelCollection.snapshots().map((querySnapshot) =>
  //       querySnapshot.docs.map((e) => Hostel.fromFirestore(document)).toList());
  // }

  Stream<List<Hostel>> getHostels() {
    return _db.collection('Hostelss').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Hostel.fromFirestore(doc.data())).toList());
  }
}

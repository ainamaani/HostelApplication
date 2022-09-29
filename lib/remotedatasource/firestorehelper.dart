import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proj/models/user.dart';
import 'package:proj/sreens/hostels.dart';

class FirestoreHelper {
//   static Stream<List<HostelModel>> read(String hostelname) {
//     final hostelCollection = FirebaseFirestore.instance
//         .collection('Hostels')
//         .where('hostelname', isEqualTo: hostelname);

//     return hostelCollection.snapshots().map((querySnapshot) =>
//         querySnapshot.docs.map((e) => HostelModel.fromSnapshot(e)).toList());
//   }

  static Stream<List<HostelModel>> read() {
    final hostelCollection = FirebaseFirestore.instance.collection('hostels');
    return hostelCollection.snapshots().map((querySnapshot) =>
        querySnapshot.docs.map((e) => HostelModel.fromSnapshot(e)).toList());
  }

  static Future create(HostelModel hostel) async {
    final hostelCollection = FirebaseFirestore.instance.collection('Hostels');

    final docRef = hostelCollection.doc();

    final newHostel = HostelModel(
      hostelname: hostel.hostelname,
      singlerooms: hostel.singlerooms,
      pricesingleroom: hostel.pricesingleroom,
      bookingsingleroom: hostel.bookingsingleroom,
      doublerooms: hostel.doublerooms,
      pricedoubleroom: hostel.pricedoubleroom,
      bookingdoubleroom: hostel.bookingdoubleroom,
      servicesoffered: hostel.servicesoffered,
      contacts: hostel.contacts,
    ).toJson();

    try {
      await docRef.set(newHostel);
    } catch (e) {
      print('Some error occured $e');
    }
  }

  // static Future getHostel(String hostelname) async {
  //   List hostelList = [];
  //   try {
  //     await FirebaseFirestore.instance
  //         .collection('Hostels')
  //         .where('hostelname', isEqualTo: hostelname)
  //         .get()
  //         .then((QuerySnapshot querySnapshot) => {
  //               querySnapshot.docs.forEach((doc) {
  //                 hostelList.add(doc.data());
  //               }),
  //             });
  //     return hostelList;
  //   } catch (e) {
  //     print(e.toString());
  //     return null;
  //   }
  // }
}

import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';

class Userr {
  final String uid;

  Userr({this.uid});
}

class HostelModel {
  final String hostelname;
  final String singlerooms;
  final String pricesingleroom;
  final String bookingsingleroom;
  final String doublerooms;
  final String pricedoubleroom;
  final String bookingdoubleroom;
  final String servicesoffered;
  final String contacts;

  HostelModel(
      {this.hostelname,
      this.singlerooms,
      this.pricesingleroom,
      this.bookingsingleroom,
      this.doublerooms,
      this.pricedoubleroom,
      this.bookingdoubleroom,
      this.servicesoffered,
      this.contacts});

  factory HostelModel.fromSnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return HostelModel(
        hostelname: snapshot['hostelname'],
        singlerooms: snapshot['singlerooms'],
        pricesingleroom: snapshot['pricesingleroom'],
        bookingsingleroom: snapshot['bookingsingleroom'],
        doublerooms: snapshot['doublerooms'],
        pricedoubleroom: snapshot['pricedoubleroom'],
        bookingdoubleroom: snapshot['bookingdoubleroom'],
        servicesoffered: snapshot['servicesoffered'],
        contacts: snapshot['contacts']);
  }

  Map<String, dynamic> toJson() => {
        'hostelname': hostelname,
        'singlerooms': singlerooms,
        'pricesingleroom': pricesingleroom,
        'bookingsingleroom': bookingsingleroom,
        'doublerooms': doublerooms,
        'pricedoubleroom': pricedoubleroom,
        'bookingdoubleroom': bookingdoubleroom,
        'servicesoffered': servicesoffered,
        'contacts': contacts
      };
}



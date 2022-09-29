class Hostel {
  final String hostelId;
  final String hostelname;
  final double singlerooms;
  final double pricesingleroom;
  final double bookingfeesingle;
  final double doublerooms;
  final double pricedoubleroom;
  final double bookingfeedouble;
  final String servicesoffered;
  final String contacts;

  Hostel(
      {this.hostelId,
      this.hostelname,
      this.singlerooms,
      this.pricesingleroom,
      this.bookingfeesingle,
      this.doublerooms,
      this.pricedoubleroom,
      this.bookingfeedouble,
      this.servicesoffered,
      this.contacts});

  Map<String, dynamic> toMap() {
    return {
      'hostelId': hostelId,
      'hostelname': hostelname,
      'singlerooms': singlerooms,
      'pricesingleroom': pricesingleroom,
      'bookingfeesingle': bookingfeesingle,
      'doublerooms': doublerooms,
      'pricedoubleroom': pricedoubleroom,
      'bookingfeedouble': bookingfeedouble,
      'servicesoffered': servicesoffered,
      'contacts': contacts
    };
  }

  Hostel.fromFirestore(Map<String, dynamic> firestore)
      : hostelId = firestore['hostelId'],
        hostelname = firestore['hostelname'],
        singlerooms = firestore['singlerooms'],
        pricesingleroom = firestore['pricesingleroom'],
        bookingfeesingle = firestore['bookingfeesingle'],
        doublerooms = firestore['doublerooms'],
        pricedoubleroom = firestore['pricedoubleroom'],
        bookingfeedouble = firestore['bookingfeedouble'],
        servicesoffered = firestore['services'],
        contacts = firestore['contacts'];
}

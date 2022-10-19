import 'package:flutter/cupertino.dart';
import 'package:proj/models/hostel.dart';
import 'package:proj/services/firestoreservice.dart';
import 'package:uuid/uuid.dart';

class HostelProvider with ChangeNotifier {
  final firestoreService = FirestoreService();
  String _hostelname;
  double _singlerooms;
  double _pricesingleroom;
  double _bookingfeesingle;
  double _doublerooms;
  double _pricedoubleroom;
  double _bookingfeedouble;
  String _servicesoffered;
  String _contacts;
  var uuid = Uuid();

  //Getters
  String get hostelname => _hostelname;
  double get singlerooms => _singlerooms;
  double get pricesingleroom => _pricesingleroom;
  double get bookingfeesingle => _bookingfeesingle;
  double get doublerooms => _doublerooms;
  double get pricedoubleroom => _pricedoubleroom;
  double get bookingfeedouble => _bookingfeedouble;
  String get servicesoffered => _servicesoffered;
  String get contacts => _contacts;

  //Setters
  changeHostelname(String value) {
    _hostelname = value;
    notifyListeners();
  }

  changeSinglerooms(String value) {
    _singlerooms = double.parse(value);
    notifyListeners();
  }

  changePricesingleroom(String value) {
    _pricesingleroom = double.parse(value);
    notifyListeners();
  }

  changeBookingfeesingle(String value) {
    _bookingfeesingle = double.parse(value);
    notifyListeners();
  }

  changeDoublerooms(String value) {
    _doublerooms = double.parse(value);
    notifyListeners();
  }

  changePricedoubleroom(String value) {
    _pricedoubleroom = double.parse(value);
    notifyListeners();
  }

  changeBookingfeedouble(String value) {
    _bookingfeedouble = double.parse(value);
    notifyListeners();
  }

  changeServicesoffered(String value) {
    _servicesoffered = value;
    notifyListeners();
  }

  changeContacts(String value) {
    _contacts = value;
    notifyListeners();
  }

  submitDetails() {
    var newHostel = Hostel(
        hostelname: hostelname,
        singlerooms: singlerooms,
        pricesingleroom: pricesingleroom,
        bookingfeesingle: bookingfeesingle,
        doublerooms: doublerooms,
        pricedoubleroom: pricedoubleroom,
        bookingfeedouble: bookingfeedouble,
        servicesoffered: servicesoffered,
        contacts: contacts,
        hostelId: uuid.v4());
    firestoreService.submitDetails(newHostel);
  }
}

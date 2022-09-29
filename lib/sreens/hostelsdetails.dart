import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:proj/models/user.dart';
import 'package:proj/providers/hostelprovider.dart';
import 'package:proj/remotedatasource/firestorehelper.dart';
import 'package:proj/services/auth.dart';
import 'package:provider/provider.dart';

class HostelDetails extends StatefulWidget {
  @override
  State<HostelDetails> createState() => _HostelDetailsState();
}

class _HostelDetailsState extends State<HostelDetails> {
  TextEditingController _hostelnameController = TextEditingController();
  TextEditingController _singleroomsController = TextEditingController();
  TextEditingController _pricesingleroomController = TextEditingController();
  TextEditingController _bookingfeesingleController = TextEditingController();
  TextEditingController _doubleroomsController = TextEditingController();
  TextEditingController _pricedoubleroomController = TextEditingController();
  TextEditingController _bookingfeedoubleController = TextEditingController();
  TextEditingController _servicesofferedController = TextEditingController();
  TextEditingController _contactsController = TextEditingController();
  final AuthService _auth = AuthService();
  final firebase = FirebaseFirestore.instance;

  create() async {
    try {
      await firebase.collection('hostels').doc(_hostelnameController.text).set({
        'hostelname': _hostelnameController.text,
        'singlerooms': _singleroomsController.text,
        'pricesingleroom': _pricesingleroomController.text,
        'bookingfeesingle': _bookingfeesingleController.text,
        'doublerooms': _doubleroomsController.text,
        'pricedoubleroom': _pricedoubleroomController.text,
        'bookingfeedouble': _bookingfeedoubleController.text,
        'servicesoffered': _servicesofferedController.text,
        'contacts': _contactsController.text,
      });
    } catch (e) {
      print(e);
    }
  }

  update() async {
    try {
      firebase.collection('hostels').doc(_hostelnameController.text).update({
        'singlerooms': _singleroomsController.text,
        'pricesingleroom': _pricesingleroomController.text,
        'bookingfeesingle': _bookingfeesingleController.text,
        'doublerooms': _doubleroomsController.text,
        'pricedoubleroom': _pricedoubleroomController.text,
        'bookingfeedouble': _bookingfeedoubleController.text,
        'servicesoffered': _servicesofferedController.text,
        'contacts': _contactsController.text,
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final hostelProvider = Provider.of<HostelProvider>(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text('HOSTEL DETAILSS'),
        centerTitle: true,
        actions: <Widget>[
          ElevatedButton.icon(
            icon: Icon(Icons.person),
            label: Text('Logout'),
            onPressed: () async {
              await _auth.signOut();
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.topCenter, colors: [
            Colors.cyan[500],
            Colors.cyan[300],
            Colors.cyan[400],
          ])),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 80,
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: Text(
                        'Hostel detailss',
                        style: TextStyle(color: Colors.white, fontSize: 40),
                      ),
                    ),
                    SizedBox(
                      height: 10.1,
                    ),
                    Center(
                      child: Text(
                        'Welcome to proj',
                        style: TextStyle(
                          color: Color.fromARGB(255, 201, 187, 187),
                          fontSize: 18.1,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Center(
                  child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60),
                    )),
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom:
                                          BorderSide(color: Colors.grey[200]))),
                              child: TextField(
                                controller: _hostelnameController,
                                decoration: InputDecoration(
                                    hintText: 'Name of the hostel',
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none),
                                onChanged: ((value) {
                                  hostelProvider.changeHostelname(value);
                                }),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom:
                                          BorderSide(color: Colors.grey[200]))),
                              child: TextField(
                                controller: _singleroomsController,
                                decoration: InputDecoration(
                                    hintText: 'No. of single rooms available',
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none),
                                onChanged: (value) {
                                  hostelProvider.changeSinglerooms(value);
                                },
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom:
                                          BorderSide(color: Colors.grey[200]))),
                              child: TextField(
                                controller: _pricesingleroomController,
                                decoration: InputDecoration(
                                    hintText: 'Price of a single room',
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none),
                                onChanged: (value) {
                                  hostelProvider.changePricesingleroom(value);
                                },
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom:
                                          BorderSide(color: Colors.grey[200]))),
                              child: TextField(
                                controller: _bookingfeesingleController,
                                decoration: InputDecoration(
                                    hintText: 'Booking fee for a single room',
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none),
                                onChanged: (value) {
                                  hostelProvider.changeBookingfeesingle(value);
                                },
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom:
                                          BorderSide(color: Colors.grey[200]))),
                              child: TextField(
                                controller: _doubleroomsController,
                                decoration: InputDecoration(
                                    hintText: 'No. of double rooms available',
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none),
                                onChanged: (value) {
                                  hostelProvider.changeDoublerooms(value);
                                },
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom:
                                          BorderSide(color: Colors.grey[200]))),
                              child: TextField(
                                controller: _pricedoubleroomController,
                                decoration: InputDecoration(
                                    hintText: 'Price for a double room',
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none),
                                onChanged: (value) {
                                  hostelProvider.changePricedoubleroom(value);
                                },
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom:
                                          BorderSide(color: Colors.grey[200]))),
                              child: TextField(
                                controller: _bookingfeedoubleController,
                                decoration: InputDecoration(
                                    hintText: 'Booking fee for a double room',
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none),
                                onChanged: (value) {
                                  hostelProvider.changeBookingfeedouble(value);
                                },
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom:
                                          BorderSide(color: Colors.grey[200]))),
                              child: TextField(
                                controller: _servicesofferedController,
                                decoration: InputDecoration(
                                    hintText: 'Services offered at the hostel',
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none),
                                onChanged: (value) {
                                  hostelProvider.changeServicesoffered(value);
                                },
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom:
                                          BorderSide(color: Colors.grey[200]))),
                              child: TextField(
                                controller: _contactsController,
                                decoration: InputDecoration(
                                    hintText: 'Phone contacts of the custodian',
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none),
                                onChanged: (value) {
                                  hostelProvider.changeContacts(value);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      GestureDetector(
                        child: Container(
                          height: 50,
                          margin: EdgeInsets.symmetric(horizontal: 50),
                          decoration: BoxDecoration(
                            color: Colors.cyan[500],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              'Submit details',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        onTap: () {
                          create();
                          _hostelnameController.clear();
                          _singleroomsController.clear();
                          _pricesingleroomController.clear();
                          _bookingfeedoubleController.clear();
                          _doubleroomsController.clear();
                          _pricedoubleroomController.clear();
                          _bookingfeedoubleController.clear();
                          _servicesofferedController.clear();
                          _contactsController.clear();
                          // hostelProvider.submitDetails();
                          // Navigator.of(context).pop();
                          // FirestoreHelper.create(HostelModel(
                          //         hostelname: _hostelnameController.text,
                          //         singlerooms: _singleroomsController.text,
                          //         pricesingleroom:
                          //             _pricesingleroomController.text,
                          //         bookingsingleroom:
                          //             _bookingfeesingleController.text,
                          //         doublerooms: _doubleroomsController.text,
                          //         pricedoubleroom:
                          //             _pricedoubleroomController.text,
                          //         bookingdoubleroom:
                          //             _bookingfeedoubleController.text,
                          //         servicesoffered:
                          //             _servicesofferedController.text,
                          //         contacts: _contactsController.text))
                          //     .then((value) => ScaffoldMessenger.of(context)
                          //         .showSnackBar(SnackBar(
                          //             content: Text(
                          //                 'Hostel details added successfully'))));
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        child: Container(
                          height: 50,
                          margin: EdgeInsets.symmetric(horizontal: 50),
                          decoration: BoxDecoration(
                            color: Colors.cyan[500],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              'Update details',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        onTap: () {
                          update();
                          _hostelnameController.clear();
                          _singleroomsController.clear();
                          _pricesingleroomController.clear();
                          _bookingfeedoubleController.clear();
                          _doubleroomsController.clear();
                          _pricedoubleroomController.clear();
                          _bookingfeedoubleController.clear();
                          _servicesofferedController.clear();
                          _contactsController.clear();
                        },
                      )
                    ],
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:proj/models/user.dart';
import 'package:proj/services/auth.dart';
import 'package:proj/shared/loading.dart';
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
  bool loading = false;

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
    // final hostelProvider = Provider.of<HostelProvider>(context);
    return loading
        ? Loading()
        : Scaffold(
            resizeToAvoidBottomInset: true,
            appBar: AppBar(
              title: Text('HOSTEL DETAILS'),
              // centerTitle: true,
              backgroundColor: Colors.cyan,
              actions: <Widget>[
                ElevatedButton(
                  // child: Icon(Icons.person),

                  child: Text('Logout'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.cyan),
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
                    gradient:
                        LinearGradient(begin: Alignment.topCenter, colors: [
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
                              'Hostel details',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 40),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: Text(
                              'HostelApp',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
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
                                            bottom: BorderSide(
                                                color: Colors.grey[200]))),
                                    child: TextField(
                                      controller: _hostelnameController,
                                      decoration: InputDecoration(
                                          hintText: 'Name of the hostel',
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          labelText: 'Hostel',
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.always,
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              borderSide: BorderSide(
                                                  color: Colors.blue))),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey[200]))),
                                    child: TextField(
                                      controller: _singleroomsController,
                                      decoration: InputDecoration(
                                          hintText:
                                              'No. of single rooms available',
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          labelText: 'Single rooms available',
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.always,
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              borderSide: BorderSide(
                                                  color: Colors.blue))),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey[200]))),
                                    child: TextField(
                                      controller: _pricesingleroomController,
                                      decoration: InputDecoration(
                                          hintText: 'Price of a single room',
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          labelText: 'Price per single room',
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.always,
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              borderSide: BorderSide(
                                                  color: Colors.blue))),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey[200]))),
                                    child: TextField(
                                      controller: _bookingfeesingleController,
                                      decoration: InputDecoration(
                                          hintText:
                                              'Booking fee for a single room',
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          labelText:
                                              'Booking fee per single room',
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.always,
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              borderSide: BorderSide(
                                                  color: Colors.blue))),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey[200]))),
                                    child: TextField(
                                      controller: _doubleroomsController,
                                      decoration: InputDecoration(
                                          hintText:
                                              'No. of double rooms available',
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          labelText: 'Double rooms available',
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.always,
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              borderSide: BorderSide(
                                                  color: Colors.blue))),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey[200]))),
                                    child: TextField(
                                      controller: _pricedoubleroomController,
                                      decoration: InputDecoration(
                                          hintText: 'Price for a double room',
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          labelText: 'Price per double room',
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.always,
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              borderSide: BorderSide(
                                                  color: Colors.blue))),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey[200]))),
                                    child: TextField(
                                      controller: _bookingfeedoubleController,
                                      decoration: InputDecoration(
                                          hintText:
                                              'Booking fee for a double room',
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          labelText: 'Booking fee per double',
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.always,
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              borderSide: BorderSide(
                                                  color: Colors.blue))),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey[200]))),
                                    child: TextField(
                                      controller: _servicesofferedController,
                                      decoration: InputDecoration(
                                          hintText:
                                              'Services offered at the hostel',
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          labelText: 'Services',
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.always,
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              borderSide: BorderSide(
                                                  color: Colors.blue))),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey[200]))),
                                    child: TextField(
                                      controller: _contactsController,
                                      decoration: InputDecoration(
                                          hintText:
                                              'Phone contacts of the custodian',
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          labelText: "Custodian's contacts",
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.always,
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              borderSide: BorderSide(
                                                  color: Colors.blue))),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  child: Container(
                                    height: 50,
                                    width: 130,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
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
                                  onTap: () async {
                                    create();

                                    Navigator.pushNamed(
                                        context, '/successscreen');
                                    // setState(() => loading = true);
                                  },
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                GestureDetector(
                                  child: Container(
                                    width: 130,
                                    height: 50,
                                    margin: EdgeInsets.symmetric(horizontal: 5),
                                    decoration: BoxDecoration(
                                      color: Colors.green[500],
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
                                    Navigator.pushNamed(
                                        context, '/updatesuccessscreen');
                                  },
                                )
                              ],
                            ),
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

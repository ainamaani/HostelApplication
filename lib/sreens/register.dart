import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:proj/services/auth.dart';

import '../shared/loading.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  String email = '';
  String hostelname = '';
  String password = '';
  String password2 = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            resizeToAvoidBottomInset: true,
            appBar: AppBar(
              title: Text('REGISTER'),
              centerTitle: true,
              backgroundColor: Colors.cyan,
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
                              'Sign up',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 40),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: Text(
                              'Welcome to HostelApp',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Column(children: [
                      Container(
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
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: Colors.grey[200]))),
                                        child: Form(
                                          key: _formKey,
                                          child: Column(children: [
                                            TextFormField(
                                              onChanged: (val) {
                                                setState(
                                                    () => hostelname = val);
                                              },
                                              decoration: InputDecoration(
                                                  hintText:
                                                      'Name of the hostel',
                                                  hintStyle: TextStyle(
                                                      color: Colors.grey),
                                                  labelText: 'Hostel',
                                                  floatingLabelBehavior:
                                                      FloatingLabelBehavior
                                                          .always,
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      borderSide: BorderSide(
                                                          color: Colors.blue))),
                                            ),
                                            SizedBox(
                                              height: 40.0,
                                            ),
                                            TextFormField(
                                              validator: (val) => val.isEmpty
                                                  ? 'Enter an email'
                                                  : null,
                                              onChanged: (val) {
                                                setState(() => email = val);
                                              },
                                              decoration: InputDecoration(
                                                  hintText: 'Enter your email',
                                                  hintStyle: TextStyle(
                                                      color: Colors.grey),
                                                  labelText: 'Email',
                                                  floatingLabelBehavior:
                                                      FloatingLabelBehavior
                                                          .always,
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      borderSide: BorderSide(
                                                          color: Colors.blue))),
                                            ),
                                            SizedBox(
                                              height: 40.0,
                                            ),
                                            TextFormField(
                                              validator: (val) => val.length < 6
                                                  ? 'Enter a password 6+ chars long'
                                                  : null,
                                              onChanged: (val) {
                                                setState(() => password = val);
                                              },
                                              obscureText: true,
                                              decoration: InputDecoration(
                                                  hintText:
                                                      'Enter your password',
                                                  hintStyle: TextStyle(
                                                      color: Colors.grey),
                                                  labelText: 'Password',
                                                  floatingLabelBehavior:
                                                      FloatingLabelBehavior
                                                          .always,
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      borderSide: BorderSide(
                                                          color: Colors.blue))),
                                            ),
                                            SizedBox(
                                              height: 40.0,
                                            ),
                                            TextFormField(
                                              onChanged: (val) {
                                                setState(() => password2 = val);
                                              },
                                              obscureText: true,
                                              decoration: InputDecoration(
                                                  hintText: 'Confirm password',
                                                  hintStyle: TextStyle(
                                                      color: Colors.grey),
                                                  labelText: 'Password Again',
                                                  floatingLabelBehavior:
                                                      FloatingLabelBehavior
                                                          .always,
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      borderSide: BorderSide(
                                                          color: Colors.blue))),
                                            ),
                                          ]),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Already have an account?',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  ElevatedButton(
                                    child: Text(
                                      'Login',
                                      style: TextStyle(color: Colors.cyan),
                                    ),
                                    onPressed: () {
                                      widget.toggleView();
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 30,
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
                                      'Sign up',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                onTap: () async {
                                  if (_formKey.currentState.validate()) {
                                    setState(() => loading = true);
                                    dynamic result = await _auth
                                        .registerWithEmailAndPassword(
                                            email, password);
                                    if (result == null) {
                                      setState(() {
                                        error =
                                            'Couldnt sign in with those credentials';
                                        loading = false;
                                      });
                                    }
                                  }
                                },
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                error,
                                style: TextStyle(
                                    color: Colors.red, fontSize: 14.0),
                              )
                            ],
                          ),
                        ),
                      )
                    ])
                  ],
                ),
              ),
            ),
          );
  }
}

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:proj/services/auth.dart';

class UpdateSuccessScreen extends StatefulWidget {
  const UpdateSuccessScreen({Key key}) : super(key: key);

  @override
  State<UpdateSuccessScreen> createState() => _UpdateSuccessScreenState();
}

class _UpdateSuccessScreenState extends State<UpdateSuccessScreen> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[300],
      appBar: AppBar(
        title: Text(
          'UPDATE DETAILS STATUS',
          style: TextStyle(),
        ),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 150, 10, 250),
        child: Card(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 60,
              ),
              Text(
                'Hostel details have been updated successfully',
                style: TextStyle(fontSize: 25, color: Colors.green),
              ),
              SizedBox(
                height: 30,
              ),
              Icon(
                Icons.check_circle_rounded,
                size: 50,
                color: Colors.green,
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

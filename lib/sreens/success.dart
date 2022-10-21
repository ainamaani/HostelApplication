import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:proj/services/auth.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({Key key}) : super(key: key);

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'DETAILS STATUS',
          style: TextStyle(),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Color.fromARGB(255, 3, 94, 6),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 150, 10, 200),
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
                'Hostel details have been added successfully',
                style: TextStyle(fontSize: 25, color: Colors.green),
              ),
              SizedBox(
                height: 30,
              ),
              Icon(
                Icons.check_circle_rounded,
                size: 80,
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

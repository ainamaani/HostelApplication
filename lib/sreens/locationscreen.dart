import 'dart:ui';

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:proj/blocs/Applicationblocs.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../shared/loading.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    final applicationBloc = Provider.of<ApplicationBloc>(context);

    return loading
        ? Loading()
        : Scaffold(
            body: (applicationBloc.currentLocation == null)
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView(
                    children: [
                      Container(
                        height: 750.0,
                        child: Stack(children: [
                          GoogleMap(
                            mapType: MapType.normal,
                            myLocationEnabled: true,
                            initialCameraPosition: CameraPosition(
                                target: LatLng(
                                    applicationBloc.currentLocation.latitude,
                                    applicationBloc.currentLocation.longitude),
                                zoom: 14),
                          ),
                          Positioned(
                            bottom: 0,
                            child: GestureDetector(
                              onTap: () {
                                launchUrl(
                                    Uri.parse('https://www.google.ca/maps'));
                                setState(() => loading = true);
                              },
                              child: Container(
                                padding: const EdgeInsets.all(15),
                                width: MediaQuery.of(context).size.width,
                                color: Colors.lightBlue,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(Icons.location_on),
                                    Text(
                                      'Search hostel',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ]),
                      )
                    ],
                  ),
          );
  }
}

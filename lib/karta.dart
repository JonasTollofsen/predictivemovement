// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'job.dart';
import 'job_bank.dart';
import 'globals.dart' as globals;
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'konto.dart';



class Karta extends StatefulWidget {

  @override
  State<Karta> createState() => _KartaState();

}
final Set<Marker> _markers = {};

class _KartaState extends State<Karta> {
  Set<Marker> listMarkers = {};
  late GoogleMapController mapController;


  Completer<GoogleMapController> _controller = Completer();


  static final CameraPosition initCameraPosition = CameraPosition(
      bearing: 180,
      target: LatLng(65.584816, 22.154751),
      tilt: 45,
      zoom: 13.5
  );



  @override
  Widget build(BuildContext context) {
    int i = 0;
    String markerValue1 = '';
    Set <Marker>listMarkers = generateMarkers(context);

    return GoogleMap(
        onMapCreated:(GoogleMapController controller) {
          _controller.complete(controller);
        },
        initialCameraPosition: initCameraPosition,
        compassEnabled: true,
      markers: listMarkers,
    );
  }
}
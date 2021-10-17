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
  final Completer<GoogleMapController> _controller = Completer();
  late BitmapDescriptor customPin;


  static final CameraPosition initCameraPosition = CameraPosition(
      bearing: 180,
      target: LatLng(65.584816, 22.154751),
      tilt: 0,
      zoom: 15
  );

  @override
  void initState() {
    BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5),
        'assets/destination_map_marker.png').then((onValue) {
      customPin = onValue;
     }
    );
  }


  @override
  Widget build(BuildContext context) {
    listMarkers = generateMarkers(context);

    return GoogleMap(
        onMapCreated:(GoogleMapController controller) {
          _controller.complete(controller);
        },
      indoorViewEnabled: false,
      initialCameraPosition: initCameraPosition,
        compassEnabled: true,
      buildingsEnabled: false,
      mapType: MapType.terrain,
      myLocationButtonEnabled: true,
      markers: listMarkers,
    );
  }
}
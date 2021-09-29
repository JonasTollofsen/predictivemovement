// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Kalender extends StatefulWidget {

  @override
  _KalenderState createState() => _KalenderState();
}

class _KalenderState extends State<Kalender> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "KALENDER PAGE CONTENT",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 50.0
          ),
        ),
      ],
    );
  }
}

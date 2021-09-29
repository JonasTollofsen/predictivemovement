// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Installningar extends StatefulWidget {

  @override
  _InstallningarState createState() => _InstallningarState();
}

class _InstallningarState extends State<Installningar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "INSTÄLLNINGAR PAGE CONTENT",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 50.0
          ),
        ),
      ],
    );
  }
}

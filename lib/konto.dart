// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Konto extends StatefulWidget {

  @override
  State<Konto> createState() => _KontoState();
}

class _KontoState extends State<Konto> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "KONTO PAGE CONTENT",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 50.0
          ),
        ),
      ],
    );
  }
}

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Karta extends StatefulWidget {

  @override
  State<Karta> createState() => _KartaState();
}

class _KartaState extends State<Karta> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "KARTA PAGE CONTENT",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 50.0
          ),
        ),
      ],
    );
  }
}

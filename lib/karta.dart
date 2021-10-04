// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'job.dart';
import 'job_bank.dart';
import 'globals.dart' as globals;

class Karta extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return globals.jobBank.generateListOfAvailableJobs();
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'job.dart';
import 'job_bank.dart';
import 'globals.dart' as globals;



class Jobba extends StatefulWidget {
  const Jobba({Key? key}) : super(key: key);

  @override
  _JobbaState createState() => _JobbaState();
}

class _JobbaState extends State<Jobba> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: globals.jobBank.generateListOfAvailableJobs()),
        ElevatedButton(onPressed: (){setState(() {

        });}, child: Text("refresh"))
      ],
    );
  }
}


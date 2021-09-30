import 'package:flutter/material.dart';
import 'main_page.dart';
import 'konto.dart';
import 'kalender.dart';
import 'installningar.dart';
import 'karta.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class JobDetails extends StatelessWidget {
  const JobDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          onPressed: (){
            Navigator.pop(context);
          },
          child: const Text("return!"),
      ),
    );
  }
}

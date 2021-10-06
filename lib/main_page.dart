// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:predictivemovement/job.dart';
import 'globals.dart' as globals;



class MainPage extends StatefulWidget {

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Container( // map
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/luleå.png')
                )
            ),
          ),
        ),

        Column(
          children: [
            Text("Hej " + globals.loggedInUser.getUsername() + "!"),
            Text(
              "Kommande Jobb",
              style: TextStyle(
                  fontSize: 20

              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80),
              child: SizedBox(
                width: double.infinity,

                child: Divider(
                  thickness: 1,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),

        Expanded(
          flex: 2,
          child: globals.loggedInUser.generateListOfAcceptedJobs(
              globals.loggedInUser),
        ),
        Padding(
          padding: const EdgeInsets.only(
              bottom: 20,
              top: 20
          ),
          child: ElevatedButton(
            onPressed: () {
              setState(() {

              });
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Lägg till rutt",
                style: TextStyle(
                    fontSize: 20.0
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

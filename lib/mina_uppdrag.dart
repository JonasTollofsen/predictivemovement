// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:predictivemovement/account.dart';
import 'package:predictivemovement/job.dart';
import 'globals.dart' as globals;
import 'package:flutter/animation.dart';

class MinaUppdrag extends StatefulWidget {

  @override
  _MinaUppdragState createState() => _MinaUppdragState();
}

class _MinaUppdragState extends State<MinaUppdrag> {
  bool showTidigareBokningar = true;
  bool showAktuellaBokningar = true;
  String buttonText = "visa mer";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Visibility(
            visible: showAktuellaBokningar,
            child: Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                        "Aktuella bokningar",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Expanded(
                    child: GenerateListOfAcceptedJobs(globals.loggedInUser),
                  ),


                  MaterialButton(
                      onPressed: (){
                        setState(() {
                          if(!showTidigareBokningar){
                            buttonText = "Visa mer";
                            showTidigareBokningar = true;
                          }else if (showTidigareBokningar){
                            buttonText = "Minimera";
                            showTidigareBokningar = false;
                          }
                        });

                      },
                    child: Text(
                        buttonText,
                      style: TextStyle(
                        fontSize: 17
                      ),
                    ),
                      )
                ],
              ),
            ),
          ),

          Visibility(
            visible: showTidigareBokningar,
            child: Expanded(
              flex: 2,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      "Tidigare bokningar",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),

                  Expanded(
                      child: GenerateListOfCompletedJobs(globals.loggedInUser)
                  ),



                  MaterialButton(
                    onPressed: (){
                    setState(() {
                      if (!showAktuellaBokningar) {
                        buttonText = "Visa mer";
                        showAktuellaBokningar = true;
                      } else if (showAktuellaBokningar) {
                        buttonText = "Minimera";
                        showAktuellaBokningar = false;
                        }
                      });
                    },
                    child: Text(
                        buttonText,
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

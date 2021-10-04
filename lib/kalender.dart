// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:predictivemovement/account.dart';
import 'package:predictivemovement/job.dart';
import 'globals.dart' as globals;
import 'package:flutter/animation.dart';

class Kalender extends StatefulWidget {

  @override
  _KalenderState createState() => _KalenderState();
}

class _KalenderState extends State<Kalender> {
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
                    child: globals.loggedInUser.generateListOfAcceptedJobs(
                        globals.loggedInUser),
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

class Booking extends StatelessWidget {
  IconData typeOfJob;
  int orderNumber;
  String date;
  String time;

  Booking({
    required this.typeOfJob,
    required this.orderNumber,
    required this.date,
    required this.time
});



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: (){},
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Icon(
                  typeOfJob,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(orderNumber.toString()),
                    Text(date)
                  ],
                ),
              ),
              Text(time),

              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Icon(
                    Icons.arrow_forward_ios
                ),
              ),
            ],
          ),
        ),
        Divider(
          indent: 60,
          endIndent: 60,
          thickness: 1,
          color: Colors.black,
        ),
      ],
    );
  }
}

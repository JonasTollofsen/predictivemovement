// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:predictivemovement/login_page.dart';
import 'package:predictivemovement/mina_uppdrag.dart';
import 'package:predictivemovement/main.dart';
import 'globals.dart' as globals;
import 'main.dart';

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
        Expanded(
          flex: 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                Icons.account_circle,
                size: 160,
              ),
              ElevatedButton(onPressed: (){},
                style: ElevatedButton.styleFrom(

                  textStyle: TextStyle(
                    fontSize: 17
                  )
                ),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: 160
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,

                    children: [
                      Icon(Icons.edit),
                      Text("Redigera profil"),
                    ],
                  ),
                ),
              ),

              ElevatedButton(onPressed: (){
                logout(context);
              },
                style: ElevatedButton.styleFrom(
                    textStyle: TextStyle(
                        fontSize: 17
                    )
                ),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: 160,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                    children: [
                      Icon(Icons.logout),
                      Text("Logga ut"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Icon(
                      Icons.check
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Icon(
                        Icons.check
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Icon(
                        Icons.check
                    ),
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                      "ID verifierat",
                  ),
                  Text("Taxiförlag verifierat"),
                  Text("Mobilnummer verifierat")
                ],
              )

                ],
              ),
            ),



        Expanded(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Icon(
                        FontAwesomeIcons.car
                    ),
                  ),
                  Text(globals.loggedInUser.completedJobs.length.toString() + " genomförda uppdrag")
                ],
              ),
              MaterialButton(
                  onPressed: (){
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                          "Visa uppdrag"
                      ),
                      Icon(
                          Icons.arrow_forward_ios
                      ),
                    ],
                  )
              ),
            ],
          ),
        ),


        Expanded(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Icon(
                        FontAwesomeIcons.solidStar
                    ),
                  ),
                  Text("4.5 - 23 omdömen")
                ],
              ),

              MaterialButton(
                  onPressed: (){},
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                          "Visa omdömen"
                      ),
                      Icon(
                          Icons.arrow_forward_ios
                      ),
                    ],
                  )
              )
            ],
          ),
        ),
      ],
    );
  }
}

void logout(context){
  pushNewScreenWithRouteSettings(
      context,
      screen: LoginPage()
      , settings: RouteSettings(

    ),
    withNavBar: false
  );
}

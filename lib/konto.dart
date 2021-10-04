// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
          flex: 2,
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
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,

                  children: [
                    Icon(Icons.edit),
                    Text("Redigera profil"),
                  ],
                ),
              ),
            ],
          ),
        ),

        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,

            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.check,
                    ),
                    Text("ID verifierat")
                  ],
                ),
              ),

              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.check,
                    ),
                    Text(
                        "Taxiförarleg, verifierat"
                    )
                  ],
                ),
              ),

              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.check,
                    ),
                    Text(
                        "Mobilnummer, verifierat"
                    )
                  ],
                ),
              ),
            ],
          ),
        ),


        Expanded(
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
                  Text("27 genomförda uppdrag")
                ],
              ),
              MaterialButton(
                  onPressed: (){},
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

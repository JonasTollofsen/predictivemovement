// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

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
    return Container(
      color: Colors.red,
      child: Column(
        children: [
          Image.asset(
              'assets/Luleå.png',
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 50,
                  color: Colors.black,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text(
                              "23 km",
                          style: TextStyle(
                            color: Colors.white
                            ),
                          ),

                          Text(
                            "Körsträcka",
                            style: TextStyle(
                                color: Colors.white
                            ),
                          ),
                        ],
                      ),

                      Column(
                        children: [
                          Text(
                            "0 h 20 m",
                            style: TextStyle(
                                color: Colors.white
                            ),
                          ),

                          Text(
                            "Uppskattad tid",
                            style: TextStyle(
                                color: Colors.white
                            ),
                          ),
                        ],
                      ),

                      Column(
                        children: [
                          Text(
                            "29/19 kl 12.15",
                            style: TextStyle(
                                color: Colors.white
                            ),
                          ),

                          Text(
                            "datum och tid",
                            style: TextStyle(
                                color: Colors.white
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Row(
            children: [
              Column(
                children: [
                  Text(
                    'Detaljer',
                  ),
                  Icon(
                      FontAwesomeIcons.userAlt
                  ),
                  Text("Jane Doe"),
                ],
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                      "Upphämtning: Testargatan 1, 123 45 Testby"
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

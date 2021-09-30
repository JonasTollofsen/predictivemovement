// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'job_details.dart';

class Karta extends StatefulWidget {

  @override
  State<Karta> createState() => _KartaState();
}

class _KartaState extends State<Karta> {
  @override
  Widget build(BuildContext context) {
    return

    ListView(
      children: <Widget>[

        JobCard(
          typeOfJob: FontAwesomeIcons.car,
          date: "30 September",
          distance: 10,
          time: "13.20",
          timeToComplete: 20,
          pay: 250,
        ),

        JobCard(
          typeOfJob: FontAwesomeIcons.car,
          date: "30 September",
          distance: 30,
          time: "15.20",
          timeToComplete: 10,
          pay: 200,
        ),

        JobCard(
          typeOfJob: FontAwesomeIcons.box,
          date: "30 September",
          distance: 5,
          time: "18.00",
          timeToComplete: 20,
          pay: 400,
        ),



        JobCard(
          typeOfJob: FontAwesomeIcons.box,
          date: "01 Oktober",
          distance: 5,
          time: "16.20",
          timeToComplete: 25,
          pay: 400,
        ),

        JobCard(
          typeOfJob: FontAwesomeIcons.box,
          date: "01 Oktober",
          distance: 10,
          time: "17.20",
          timeToComplete: 15,
          pay: 200,
        ),

        JobCard(
          typeOfJob: FontAwesomeIcons.box,
          date: "01 Oktober",
          distance: 10,
          time: "18.20",
          timeToComplete: 10,
          pay: 150,
        ),

        JobCard(
          typeOfJob: FontAwesomeIcons.car,
          date: "01 Oktober",
          distance: 30,
          time: "20.00",
          timeToComplete: 40,
          pay: 500,
        ),

      ],
    );
  }
}

class JobCard extends StatelessWidget {
  final IconData typeOfJob;
  final int timeToComplete;
  final int distance;
  final String date;
  final String time;
  final int pay;

  const JobCard({
    required this.typeOfJob,
    required this.timeToComplete,
    required this.distance,
    required this.date,
    required this.time,
    required this.pay,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Material(
        borderRadius: BorderRadius.circular(20),
        elevation: 20.0,
        child: InkWell(
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => JobDetails()),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20)
            ),
            height: 200,
            width: double.infinity,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                      ),
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage(
                            'assets/Luleå.png',
                        ),
                      ),
                    ),
                  ),
                ),

                Expanded(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                            typeOfJob,
                            size: 25,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  date,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(time),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only( top: 10.0, bottom: 8.0, right: 5.0),
                                child: Icon(
                                  Icons.watch_later_outlined,
                                  size: 17.0,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 10.0, bottom: 10.0, top: 10.0),
                                child: Text(
                                    timeToComplete.toString() + " min",
                                    style: TextStyle(
                                      fontSize: 13.0
                                    ),
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.only(left: 10.0, right: 8.0),
                                child: Icon(
                                  FontAwesomeIcons.road,
                                  size: 17.0,
                                ),
                              ),
                              Text(
                                  distance.toString() + " km",
                                  style: TextStyle(
                                    fontSize: 13.0
                                  ),
                              ),
                            ],
                          ),
                        ],
                      ),
                     Expanded(
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.end,
                         children: [
                           Text(
                               pay.toString() + " SEK",
                             style: TextStyle(
                               fontSize: 18.0,
                               color: Colors.green,
                               fontWeight: FontWeight.bold
                             ),
                           ),
                           Padding(
                             padding: const EdgeInsets.all(16.0),
                             child: Icon(
                               Icons.arrow_forward_ios,
                               color: Colors.black,
                             ),
                           ),
                         ],
                       ),
                     ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

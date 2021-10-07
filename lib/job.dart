
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'chat.dart';
import 'chat_message.dart';
import 'globals.dart' as globals;
import 'account.dart';

class Job {

final String customerName;
final String pickupAddress;
final String destination;
final int distance;
final int timeToComplete;
final String date;
final String time;
final int payout;
final IconData typeOfJob;
late Account worker;
bool jobComplete;
bool jobAccepted;
final LatLng latLng;
List<ChatMessage> messages = [
ChatMessage(messageContent: "Detta är ett testmeddelande från föraren", messageType: "sender"),
ChatMessage(messageContent: "Detta är ett testmeddelande från kunden", messageType: "receiver"),
];

Job ({
  required this.jobComplete,
  required this.customerName,
  required this.pickupAddress,
  required this.destination,
  required this.distance,
  required this.timeToComplete,
  required this.date,
  required this.time,
  required this.payout,
  required this.typeOfJob,
  required this.latLng,
  required this.jobAccepted,
});


String getCustomerName(){
  return customerName;
}

String getPickupAddress(){
  return pickupAddress;
}

String getDestination(){
  return destination;
}

int getDistance(){
  return distance;
}

int getTimeToComplete(){
  return timeToComplete;
}

String getDate(){
  return date;
}

String getTime(){
  return time;
}

int getPayout(){
  return payout;
}

IconData getTypeOfJob(){
  return typeOfJob;
}

void setWorker(Account worker){
  this.worker = worker;
}
void removeWorker(){
  worker = Account("None", "None", "None");
}
LatLng getLatLng(){
  return latLng;
}

}

class JobCard extends StatelessWidget {

  final Job jobDetails;
  bool showMap;

    JobCard({
    required this.jobDetails,
     required this.showMap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Material(
        borderRadius: BorderRadius.circular(20),
        elevation: 10.0,
        child: InkWell(
          onTap: (){
            pushNewScreen(
                context, screen: JobDetails(jobDetails: jobDetails)
            );
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20)
            ),

            width: double.infinity,
            child: Column(
              children: [

                Visibility(
                  visible: showMap,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 100
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(15),
                      ),
                      child: GoogleMap(
                        scrollGesturesEnabled: false,
                        mapToolbarEnabled: false,
                        zoomControlsEnabled: false,
                        onTap: (latlng){
                            pushNewScreen(
                                context,
                                screen: JobDetails(jobDetails: jobDetails),
                              );
                            },
                        initialCameraPosition: CameraPosition(
                          zoom: 15,
                          target: jobDetails.latLng,
                          tilt: 20,
                        ),
                        compassEnabled: false,
                      ),
                    ),
                  ),
                ),


                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        jobDetails.getTypeOfJob(),
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
                                jobDetails.getDate(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(jobDetails.getTime()),
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
                                jobDetails.getTimeToComplete().toString() + " min",
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
                              jobDetails.getDistance().toString() + " km",
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
                            jobDetails.getPayout().toString() + " SEK",
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class JobDetails extends StatelessWidget {
  final Job jobDetails;

  const JobDetails({
    required this.jobDetails
  });

  @override
  Widget build(BuildContext context) {

    String jobStatus;
    if(jobDetails.jobComplete){
      jobStatus = "GENOMFÖRD";
    } else {
      jobStatus = "EJ GENOMFÖRD";
    }

    return Scaffold(
      body: ListView(
        children: [
          ScrollConfiguration(
            behavior: MyBehavior(),
            child: SafeArea(
              child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Material(
                        elevation: 10,
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(30)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ConstrainedBox(
                                  constraints: BoxConstraints(
                                      maxHeight: 250
                                  ),
                                  child: Expanded(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(15),
                                      ),
                                      child: GoogleMap(
                                        zoomControlsEnabled: false,
                                        initialCameraPosition: CameraPosition(
                                            zoom: 16,
                                            target: jobDetails.latLng
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius: BorderRadius.vertical(
                                                bottom: Radius.circular(15)
                                            )
                                        ),
                                        height: 50,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Text(
                                                  jobDetails.getDistance().toString() + "km",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.bold
                                                  ),
                                                ),

                                                Text(
                                                  "Körsträcka",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.white
                                                  ),
                                                ),
                                              ],
                                            ),

                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Text(
                                                  jobDetails.getTimeToComplete().toString() + " min",
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.white
                                                  ),
                                                ),

                                                Text(
                                                  "Uppskattad tid",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 10
                                                  ),
                                                ),
                                              ],
                                            ),

                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Text(
                                                  jobDetails.getDate() + " " + jobDetails.getTime(),
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.white
                                                  ),
                                                ),

                                                Text(
                                                  "datum och tid",
                                                  style: TextStyle(
                                                      fontSize: 10,
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
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 20,  horizontal: 5),
                                      child: Text('Detaljer:'),
                                    ),
                                  ],
                                ),

                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextButton(
                                      onPressed: (){},
                                      style: TextButton.styleFrom(
                                          padding: EdgeInsets.all(0)
                                      ),
                                      child: Column(
                                        children: [

                                          Icon(
                                            FontAwesomeIcons.userAlt,
                                            color: Colors.black,
                                          ),
                                          Text(
                                            jobDetails.getCustomerName(),
                                            style: TextStyle(
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    Expanded(
                                      child: Column(

                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "Upphämtning: " + jobDetails.getPickupAddress(),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),

                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "Destination: " + jobDetails.getDestination(),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),

                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 30, bottom: 30),
                                    child: Text(
                                      'Du tjänar: ' + jobDetails.getPayout().toString() + ' SEK',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                ),

                                Visibility(
                                  visible: jobDetails.jobAccepted, //text only shows if job is accepted
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.only(bottom: 15),
                                      child: Row(
                                        children: [
                                          Text(
                                            "STATUS: ",
                                            style: TextStyle(
                                                fontSize: 12
                                            ),
                                          ),
                                          Text(
                                            jobStatus,
                                            style: TextStyle(
                                              color: jobDetails.jobComplete == true?Colors.green:Colors.red,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),

                                Visibility(
                                  visible: jobDetails.jobAccepted, //button only shows if job is accepted
                                  child: ElevatedButton(
                                    onPressed: (){
                                      pushNewScreen(
                                        context, screen: Chat(jobDetails: jobDetails),
                                      );
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                            Icons.chat_rounded,
                                            size: 30,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(14.0),
                                          child: Text(
                                            "Chatta med " + jobDetails.getCustomerName(),
                                            style: TextStyle(
                                                fontSize: 17
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                Visibility(
                                  visible: !jobDetails.jobAccepted, //button only shows if job is NOT accepted
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        showDialog<String>(
                                          context: context,
                                          builder: (BuildContext context) => AlertDialog(
                                            content: const Text(
                                              'Är du säker att du vill acceptera?',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20

                                              ),
                                            ),
                                            actions: <Widget>[
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: ElevatedButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                        ;
                                                      },
                                                      style: ElevatedButton.styleFrom(
                                                          primary: Colors.red,
                                                          minimumSize: Size(100, 40)
                                                      ),
                                                      child: const Text(
                                                        'Nej',
                                                        style: TextStyle(
                                                            fontSize: 20
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: ElevatedButton(
                                                      onPressed: () {
                                                        globals.loggedInUser.acceptedJobs.add(jobDetails);
                                                        jobDetails.setWorker(globals.loggedInUser);
                                                        globals.jobBank.jobs.remove(jobDetails);
                                                        jobDetails.jobAccepted = true;
                                                        Navigator.pop(context);
                                                      },
                                                      style: ElevatedButton.styleFrom(
                                                          primary: Colors.green,
                                                          minimumSize: Size(100, 40)
                                                      ),
                                                      child: const Text(
                                                        'Ja',
                                                        style: TextStyle(
                                                            fontSize: 20
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        );
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        "Acceptera",
                                        style: TextStyle(
                                            fontSize: 20
                                        ),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                          minimumSize: Size(160, 50),
                                          primary: Colors.green
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      child: TextButton(
                        onPressed:(){
                          Navigator.pop(context);
                        },
                        child:  Container(
                          width: 40.0,
                          height: 40.0,
                          child: Icon(Icons.close, color: Colors.red, size: 40,),
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(color: Colors.black,offset: Offset(0, 1), blurRadius: 2),
                              ],
                              shape: BoxShape.circle,
                              color: Colors.white
                          ),
                        ),
                      ),
                    ),
                  ]
              ),
            ),
          )
        ],
      )
    );
  }
}


class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}






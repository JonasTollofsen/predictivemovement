// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'globals.dart' as globals;
import 'job.dart';

class Account{
  final String _username;
  final String _password;
  final String _name;
  List<Job> acceptedJobs = [];
  List<Job> completedJobs = [
    Job(
        jobComplete: true,
        customerName: 'John Smith',
        pickupAddress: 'Teststaden 45',
        destination: 'Testby 98',
        distance: 30,
        timeToComplete: 25,
        date: '10 September',
        time: '13:00',
        payout: 350,
        typeOfJob: FontAwesomeIcons.carAlt,
        latLng: LatLng(65.588061, 22.161556),
        jobAccepted: true
    ),
  ];

  Account(
      this._username,
      this._password,
      this._name,
      );

  String getUsername(){
    return _username;
  }

  String getPassword(){
    return _password;
  }

  String getName(){
    return _name;
  }
  void addJob(Job job){
    acceptedJobs.add(job);
  }

  Widget generateListOfAcceptedJobs(Account account){
    if(account.acceptedJobs.isEmpty) {
      return Center(
        child: const Text(
            "Inga accepterade jobb!",
          style: TextStyle(
            fontSize: 30
          ),
        ),
      );
    }

    sortAcceptedJobs();
    int counter = 0;
    return ListView(
      children: [
        for(counter; account.acceptedJobs.length > counter; counter++)
        JobCard(jobDetails: account.acceptedJobs[counter], showMap: false,)
      ],
    );
  }

  void sortAcceptedJobs(){
    globals.loggedInUser.acceptedJobs.sort((a, b) => a.getTime().compareTo(b.getTime(),
      ),
    );
  }
}

class GenerateListOfCompletedJobs extends StatelessWidget {
  final Account account;

  GenerateListOfCompletedJobs(this.account);

  @override
  Widget build(BuildContext context) {

    if(account.completedJobs.isEmpty) {
      return Center(
        child: const Text(
          "Inga slutförda jobb!",
          style: TextStyle(
              fontSize: 30
          ),
        ),
      );
    }

    int counter = 0;
    return ListView(
      padding: EdgeInsets.all(0),
      children: [
        for(counter; account.completedJobs.length > counter; counter++)
          JobCard(jobDetails: account.completedJobs[counter], showMap: false, )
      ],
    );
  }
}



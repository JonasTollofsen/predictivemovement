// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:predictivemovement/karta.dart';
import 'globals.dart' as globals;
import 'job.dart';
import 'kalender.dart';

class Account{
  final String _username;
  final String _password;
  final String _name;
  List<Job> acceptedJobs = [];
  List<Job> completedJobs = [];

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
      padding: EdgeInsets.all(0),
      children: [
        for(counter; account.acceptedJobs.length > counter; counter++)
        CompactCard(jobDetails: account.acceptedJobs[counter])
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
        for(counter; account.acceptedJobs.length > counter; counter++)
          CompactCard(jobDetails: account.completedJobs[counter])
      ],
    );
  }
}



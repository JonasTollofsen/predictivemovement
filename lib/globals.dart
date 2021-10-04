library my_prj.globals;

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:predictivemovement/account.dart';
import 'package:predictivemovement/account_bank.dart';
import 'package:predictivemovement/job_bank.dart';
import 'job.dart';

bool isLoggedIn = true;
Account loggedInUser = accountBank.getAccount(0);
AccountBank accountBank = AccountBank();

JobBank jobBank = JobBank(
  [
    Job(customerName: 'John Doe',
        pickupAddress: 'Testargatan 47',
        destination: 'Testargatan 87',
        distance: 47,
        timeToComplete: 30,
        date: '3 Oktober',
        time: '13:00',
        payout: 400,
        typeOfJob: FontAwesomeIcons.carAlt,
        jobComplete: false,
    ),

    Job(customerName: 'Jane Doe',
    pickupAddress: 'Testarby 55',
    destination: 'Testargatan 27',
    distance: 20,
    timeToComplete: 15,
    date: '3 Oktober',
    time: '20:00',
    payout: 400,
    typeOfJob: FontAwesomeIcons.box,
    jobComplete: false,
    ),

    Job(customerName: 'Jane Doe',
      pickupAddress: 'Teststaden 45',
      destination: 'Testgatan 66',
      distance: 40,
      timeToComplete: 30,
      date: '4 Oktober',
      time: '13:00',
      payout: 250,
      typeOfJob: FontAwesomeIcons.carAlt,
      jobComplete: false,
    ),
  ],
);


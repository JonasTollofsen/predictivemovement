library my_prj.globals;

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
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
        pickupAddress: 'Testargatan 47, 123 45, Testby',
        destination: 'Testargatan 87, 123 45, testby',
        distance: 40,
        timeToComplete: 30,
        dateTime: DateTime(2021, 10, 5, 17, 30),
        payout: 400,
        typeOfJob: FontAwesomeIcons.carAlt,
        jobComplete: false,
        latLng: const LatLng(65.582172, 22.160498),
        jobAccepted: false
    ),

    Job(customerName: 'Jane Doe',
    pickupAddress: 'Testarby 55',
    destination: 'Testargatan 27',
    distance: 10,
    timeToComplete: 15,
    dateTime: DateTime(2021, 9, 13, 17, 30),
    payout: 150,
    typeOfJob: FontAwesomeIcons.box,
    jobComplete: false,
        latLng: LatLng(65.583112, 22.156506),
        jobAccepted: false
    ),

    Job(customerName: 'Jane Doe',
      pickupAddress: 'Teststaden 45',
      destination: 'Testgatan 66',
      distance: 25,
      timeToComplete: 25,
      dateTime: DateTime(2021, 5, 20, 17, 30),
      payout: 300,
      typeOfJob: FontAwesomeIcons.carAlt,
      jobComplete: false,
      latLng: LatLng(65.582296, 22.156163),
        jobAccepted: false,
    ),
  ],
);


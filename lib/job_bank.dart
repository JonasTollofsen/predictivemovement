// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:predictivemovement/job.dart';
import 'globals.dart' as globals;

class JobBank {
  List<Job> jobs = [];

  JobBank(this.jobs);

  Widget generateListOfAvailableJobs(){
    int i = 0;

    if(globals.jobBank.jobs.isEmpty){

      return Center(
        child: Text(
          "Inga tillgängliga jobb!",
          style: TextStyle(
            fontSize: 30
          ),
        ),
      );
    } else {
      return ListView(
      children: [
        for(i; globals.jobBank.jobs.length > i; i++)
          JobCard(
            jobDetails: globals.jobBank.jobs[i],
            showMap: true,
          ),
        ],
      );
    }
  }

  void sortJobsByDistance(){
    jobs.sort((a, b) =>a.distance.compareTo(b.distance));
  }

  void sortJobsByDate(){
    jobs.sort((a, b) => a.dateTime.compareTo(b.dateTime));
  }

  void sortJobsByPay(){
    jobs.sort((a, b) => b.payout.compareTo(a.payout));
  }
}

Set<Marker> generateMarkers(context){

  Set<Marker> listMarkers = {};
  var i = 0;

  for(i; globals.jobBank.jobs.length > i; i++){
    listMarkers.add(
        CustomMarker(context, globals.jobBank.jobs[i], i)
    );
  }

  return listMarkers;
}
Marker CustomMarker(context, Job jobdetails, int i){


  return Marker(
      onTap: (){
        pushNewScreen(
            context,
            screen: JobDetails(jobDetails: jobdetails)
        );
      },

      markerId: MarkerId(i.toString()),
      position: jobdetails.getLatLng(),
      icon: BitmapDescriptor.defaultMarker,
  );

}








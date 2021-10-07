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
    sortJobs();
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

  void sortJobs(){
    jobs.sort((a, b) => a.getTime().compareTo(b.getTime(),
      ),
    );

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








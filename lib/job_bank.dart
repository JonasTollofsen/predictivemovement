import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:predictivemovement/job.dart';
import 'globals.dart' as globals;

class JobBank extends ChangeNotifier {
  List<Job> jobs = [];

  JobBank(this.jobs);

  Job getJob(int jobNumber){
    return jobs[jobNumber];
  }

  void removeJobFromBank(Job job){
    jobs.remove(job);
    notifyListeners();
  }

  Widget generateListOfAvailableJobs(){
    notifyListeners();
    int i = 0;
    sortJobs();
    return ListView(
      children: [
        for(i; globals.jobBank.jobs.length > i; i++)
          JobCard(jobDetails: globals.jobBank.jobs[i]),

      ],
    );
  }

  void sortJobs(){
    jobs.sort((a, b) => a.getTime().compareTo(b.getTime(),
      ),
    );

  }
}







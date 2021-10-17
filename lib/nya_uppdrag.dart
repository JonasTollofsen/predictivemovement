import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'job.dart';
import 'job_bank.dart';
import 'globals.dart' as globals;
import 'package:audioplayers/audioplayers.dart';



class NyaUppdrag extends StatefulWidget {
  const NyaUppdrag({Key? key}) : super(key: key);

  @override
  _NyaUppdragState createState() => _NyaUppdragState();
}

class _NyaUppdragState extends State<NyaUppdrag> {
  
  final player = AudioCache();
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Expanded(child: globals.jobBank.generateListOfAvailableJobs()),

        /*const Text(
            "Sortera på",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  onPressed: (){
                    setState(() {
                      globals.jobBank.sortJobsByDistance();
                    });
                  },
                  child: Text("Avstånd"),
              ),
              ElevatedButton(
                  onPressed: (){
                    setState(() {
                      globals.jobBank.sortJobsByPay();
                    });

                  },
                  child: Text("Betalning"),
              ),
              ElevatedButton(onPressed: (){

                setState(() {
                  globals.jobBank.sortJobsByDate();
                });

              },
                  child: Text("Datum"),
              ),
            ],
          ),
        ),*/
      ],
    );
  }
}


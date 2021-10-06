// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:predictivemovement/job.dart';
import 'dart:math';

class Chat extends StatefulWidget {
  Job jobDetails;
  final double pi = 3.1415926535897932;

  Chat({
    required this.jobDetails
});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  var textController = TextEditingController();

  @override
  void dispose(){
    textController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios
                  ),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                ),
                Icon(FontAwesomeIcons.userAlt),
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          widget.jobDetails.getCustomerName(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                          "Aktiv för 1 timme sedan",
                        style: TextStyle(
                          fontSize: 10
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: IconButton(
                      alignment: Alignment.centerRight,
                      icon: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Icon(
                            Icons.phone,
                        ),
                      ),
                      onPressed: (){},
                    ),
                ),
              ],
            ),

            JobCard(jobDetails: widget.jobDetails),
            Expanded(
              child: ListView(
                children: [
                  ChatBubbleDriver(textMessage: "Jag är snart där."),
                  ChatBubbleCustomer("Okej, jag väntar utanför."),
                  ChatBubbleDriver(textMessage: "Jag är framme nu!"),
                  ChatBubbleCustomer("Perfekt!"),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextField(
                controller: textController,
                decoration:
                InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(
                        Icons.send,
                      size: 30,
                    ),
                    onPressed: (){

                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30)
                  ),
                  hintText: "Skriv någonting här..."
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

class ChatBubbleCustomer extends StatelessWidget {
  String textMessage;

  ChatBubbleCustomer(this.textMessage);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationY(pi),
          ),
          Flexible(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20, right: 5),
                  child: Icon(
                      FontAwesomeIcons.userAlt,
                    size: 27,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(18),
                      bottomLeft: Radius.circular(18),
                      bottomRight: Radius.circular(18),
                    ),
                  ),
                  child: Text(
                    textMessage,
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatBubbleDriver extends StatelessWidget {

  String textMessage;

  ChatBubbleDriver({
    required this.textMessage,
});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Container(
              padding: EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.cyan[900],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18),
                  bottomLeft: Radius.circular(18),
                  bottomRight: Radius.circular(18),
                ),
              ),
              child: Text(
              textMessage,
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}



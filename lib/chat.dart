// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:predictivemovement/chat_message.dart';
import 'package:predictivemovement/job.dart';
import 'dart:math';

class Chat extends StatefulWidget {
  final Job jobDetails;

  Chat({
    required this.jobDetails
});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  var textController = TextEditingController();


  @override
  Widget build(BuildContext context) {

    List<ChatMessage> messages = widget.jobDetails.messages;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TopBar(context),

            JobCard(
                jobDetails: widget.jobDetails,
                showMap: true
            ),
            Expanded(
              child: ListView.builder(
                itemCount: messages.length,
                  itemBuilder: (context, index){
                  return Container(
                    padding: EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 10),
                      child: Align(
                        alignment: (messages[index].messageType == "receiver"?Alignment.topLeft:Alignment.topRight),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: (messages[index].messageType == "receiver"? Colors.grey[200]:Colors.blue[200])
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Text(messages[index].messageContent),
                          ),
                        ),
                      ),
                    );
                  }
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
                      setState(() {
                        messages.add(ChatMessage(
                            messageContent: textController.text,
                            messageType: "sender"),
                          );
                          textController.clear();
                        }
                      );
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

  Row TopBar(BuildContext context) {
    return Row(
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
                        size: 30,
                      ),
                    ),
                    onPressed: (){
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          content:
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Icon(
                                  Icons.phone,
                                  size: 28,
                                ),
                              ),
                              Text(
                                "Ring " + widget.jobDetails.getCustomerName() + "?" ,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20

                                ),
                              ),
                            ],
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
                                    },
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.red,
                                        minimumSize: Size(100, 40)
                                    ),
                                    child: const Text(
                                      'Avbryt',
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
                    },
                  ),
              ),
            ],
          );
  }
}


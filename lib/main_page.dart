// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



class MainPage extends StatefulWidget {

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  @override
  Widget build(BuildContext context) {
      return Column(
        children: <Widget>[
          Expanded(
            child: Container( // map
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/Luleå.png")
                )
              ),
          ),
        ),

          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              children: [
                Text(
                  "Kommande Jobb",
                  style: TextStyle(
                      fontSize: 20

                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 80),
                  child: SizedBox(
                    width: double.infinity,

                    child: Divider(
                      thickness: 1,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          Expanded(
            child: ListView(
              children: [
                RowItem(iconImage: FontAwesomeIcons.box),
                RowItem(iconImage: FontAwesomeIcons.car),
                RowItem(iconImage: FontAwesomeIcons.box),
                RowItem(iconImage: FontAwesomeIcons.box),
                RowItem(iconImage: FontAwesomeIcons.car),
                RowItem(iconImage: FontAwesomeIcons.car),
                RowItem(iconImage: FontAwesomeIcons.box),
                RowItem(iconImage: FontAwesomeIcons.car),
                RowItem(iconImage: FontAwesomeIcons.car),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: (){},
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 40.0),
                child: Text(
                  "Lägg till rutt",
                  style: TextStyle(
                    fontSize: 20.0
                  ),
                ),
              ),
            ),
          ),
        ],
      );
  }
}

class RowItem extends StatefulWidget {

  final IconData iconImage;

  RowItem({required this.iconImage});

  @override
  State<RowItem> createState() => _RowItemState();
}

class _RowItemState extends State<RowItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
              widget.iconImage,
              size: 40.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 200,
                padding: EdgeInsets.only(left: 30.0),
                child: const Divider(
                  thickness: 2.0,
                  color: Colors.black,
                ),
              ),

              Container(
                padding: EdgeInsets.only(left: 30.0),
                width: 150,
                child: const Divider(
                  thickness: 2.0,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 30,
          ),

         MaterialButton(
             onPressed: (){},
             child: Icon(Icons.play_arrow_rounded,
             size: 45,
             ),
          ),
        ],
      ),
    );
  }
}

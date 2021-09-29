// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'main_page.dart';
import 'konto.dart';
import 'kalender.dart';
import 'installningar.dart';
import 'karta.dart';

void main() {
  runApp(MyApp());

}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _pageIndex = 0;
  Widget child = Container();

  @override
  Widget build(BuildContext context) {

    switch(_pageIndex) {
      case 0:
        child = Konto();
        break;

      case 1:
        child = Kalender();
        break;

      case 2:
        child = MainPage();
        break;

      case 3:
        child = Karta();
        break;

      case 4:
        child = Installningar();
    }
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: child,

          bottomNavigationBar: BottomNavigationBar(
            iconSize: 27.0,


            currentIndex: _pageIndex,
            onTap: (int index) => setState(() => _pageIndex = index),
            type : BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                      Icons.account_circle_rounded
                  ),
                  label: "Konto"
              ),

              BottomNavigationBarItem(
                  icon: Icon(
                      Icons.calendar_today_outlined
                  ),
                  label: "Kalender"
              ),

              BottomNavigationBarItem(
                  icon: Icon(
                      Icons.card_travel
                  ),
                  label: "Jobba"
              ),

              BottomNavigationBarItem(
                  icon: Icon(
                      Icons.map
                  ),
                  label: "Karta"
              ),

              BottomNavigationBarItem(
                  icon: Icon(
                      Icons.settings
                  ),
                  label: "Inställningar"
              ),
            ],
          ),
        ),
      )


    );
  }
}


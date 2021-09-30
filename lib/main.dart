// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'main_page.dart';
import 'konto.dart';
import 'kalender.dart';
import 'installningar.dart';
import 'karta.dart';
import 'login_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.indigo,
    ),
    home: LoginPage(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _pageIndex = 2; // starting page
  Widget child = Container(
  );

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
    return Scaffold(
        body: child,

        bottomNavigationBar: BottomNavigationBar(
          iconSize: 27.0,
          currentIndex: _pageIndex,
          onTap: (int index) => setState(() => _pageIndex = index),
          type : BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                    FontAwesomeIcons.userAlt
                ),
                label: "Konto"
            ),

            BottomNavigationBarItem(
                icon: Icon(
                    FontAwesomeIcons.calendarAlt
                ),
                label: "Kalender"
            ),

            BottomNavigationBarItem(
                icon: Icon(
                    FontAwesomeIcons.carAlt
                ),
                label: "Jobba"
            ),

            BottomNavigationBarItem(
                icon: Icon(
                    FontAwesomeIcons.solidMap
                ),
                label: "Karta"
            ),

            BottomNavigationBarItem(
                icon: Icon(
                    FontAwesomeIcons.cog
                ),
                label: "Inställningar"
            ),
          ],
      ),
    );
  }
}


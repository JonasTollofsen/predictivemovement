// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'main_page.dart';
import 'konto.dart';
import 'kalender.dart';
import 'installningar.dart';
import 'karta.dart';
import 'login_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(LoginPage());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    Widget page = Container();

    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: Scaffold(
          body: page,

        bottomNavigationBar: BottomNavigationBarCupertino(),
      ),
    );
  }
}

int pageIndex = 2; // starting page

class BottomNavigationBarCupertino extends StatelessWidget {
  const BottomNavigationBarCupertino({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
            items: const <BottomNavigationBarItem>[
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
      tabBuilder: (context, pageIndex) {
        switch (pageIndex) {
          case 0:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: Konto(),
              );
            }
            );

          case 1:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: Kalender(),
              );
            }
            );

          case 2:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: MainPage(),
              );
            }
            );

          case 3:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: Karta(),
              );
            }
            );

          case 4:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: Installningar(),
              );
            }
            );
        }
        return Text("No Bottom nav bar sorry about that...");
      }
    );
  }
}








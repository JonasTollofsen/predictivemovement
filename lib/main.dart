// ignore_for_file: prefer_const_constructors, prefer_final_fields
import 'package:flutter/material.dart';
import 'package:predictivemovement/login_page.dart';
import 'nya_uppdrag.dart';
import 'konto.dart';
import 'mina_uppdrag.dart';
import 'installningar.dart';
import 'karta.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      body:  LoginPage(),
    ),
  )

);

class MyApp extends StatelessWidget {

  PersistentTabController controller = PersistentTabController(initialIndex: 2);

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
        context,
        resizeToAvoidBottomInset: true,
        controller: controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        stateManagement: false, // Default is true.
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: ItemAnimationProperties( // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 100),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
          duration: Duration(milliseconds: 150),
        ),
        navBarStyle: NavBarStyle.style14, // Choose the nav bar style with this property.
    );
  }
}


List<Widget> _buildScreens() {
  return [
    Konto(),
    MinaUppdrag(),
    NyaUppdrag(),
    Karta(),
    Installningar(),
  ];
}

List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      textStyle: TextStyle(
          fontSize: 10.0
      ),
      icon: Icon(FontAwesomeIcons.userAlt),
      title: ("Konto"),
      activeColorPrimary: CupertinoColors.activeBlue,
      inactiveColorPrimary: CupertinoColors.systemGrey,

    ),

    PersistentBottomNavBarItem(
      textStyle: TextStyle(
        fontSize: 10.0
      ),
      icon: Icon(
          FontAwesomeIcons.tasks),
      title: ("Mina uppdrag"),
      activeColorPrimary: CupertinoColors.activeBlue,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),

    PersistentBottomNavBarItem(
      textStyle: TextStyle(
          fontSize: 10.0
      ),
      icon: Icon(
          FontAwesomeIcons.carAlt,
      ),
      title: ("Nya uppdrag"),
      activeColorPrimary: CupertinoColors.activeBlue,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),

    PersistentBottomNavBarItem(
      textStyle: TextStyle(
          fontSize: 10.0
      ),
      icon: Icon(FontAwesomeIcons.solidMap),
      title: ("Karta"),
      activeColorPrimary: CupertinoColors.activeBlue,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),

    PersistentBottomNavBarItem(
      textStyle: TextStyle(
          fontSize: 10.0
      ),
      icon: Icon(FontAwesomeIcons.cog),
      title: ("Inställningar"),
      activeColorPrimary: CupertinoColors.activeBlue,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),

  ];
}


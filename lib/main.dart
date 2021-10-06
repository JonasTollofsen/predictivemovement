// ignore_for_file: prefer_const_constructors, prefer_final_fields
import 'package:flutter/material.dart';
import 'package:predictivemovement/job_bank.dart';
import 'package:provider/provider.dart';
import 'jobba.dart';
import 'main_page.dart';
import 'konto.dart';
import 'kalender.dart';
import 'installningar.dart';
import 'karta.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

void main() => runApp(
    MyApp()
);

class MyApp extends StatelessWidget {

  PersistentTabController _controller = PersistentTabController(initialIndex: 2);

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        stateManagement: true, // Default is true.
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
      ),
    );
  }
}


List<Widget> _buildScreens() {
  return [
    Konto(),
    Kalender(),
    Jobba(),
    Karta(),
    Installningar(),
  ];
}

List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      icon: Icon(FontAwesomeIcons.userAlt),
      title: ("Konto"),
      activeColorPrimary: CupertinoColors.activeBlue,
      inactiveColorPrimary: CupertinoColors.systemGrey,

    ),

    PersistentBottomNavBarItem(
      icon: Icon(
          FontAwesomeIcons.calendarAlt),
      title: ("Kalender"),
      activeColorPrimary: CupertinoColors.activeBlue,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),

    PersistentBottomNavBarItem(
      icon: Icon(
          FontAwesomeIcons.carAlt,
      ),
      title: ("Jobba"),
      activeColorPrimary: CupertinoColors.activeBlue,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),

    PersistentBottomNavBarItem(
      icon: Icon(FontAwesomeIcons.solidMap),
      title: ("Karta"),
      activeColorPrimary: CupertinoColors.activeBlue,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),

    PersistentBottomNavBarItem(
      icon: Icon(FontAwesomeIcons.cog),
      title: ("Inställningar"),
      activeColorPrimary: CupertinoColors.activeBlue,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),

  ];
}


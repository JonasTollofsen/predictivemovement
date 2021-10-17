// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:predictivemovement/main.dart';
import 'bli_medlem.dart';
import 'globals.dart' as globals;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Image.asset(
                      'assets/Logo-vit-1.png',
                    color: Colors.black,
                  ),
                ),
                Expanded(
                  child: Text(
                      "Logga in med Mobilt BankID",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomButton(
                              buttonText: "Logga in",
                              route: MaterialPageRoute(
                                  builder: (context) => MyApp(),
                              ),
                            ),

                            CustomButton(
                                buttonText: "Bli medlem",
                                route: MaterialPageRoute(
                                    builder: (context) => BliMedlem(),
                                ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
    );
  }
}




class CustomButton extends StatelessWidget {
  final String buttonText;
  final MaterialPageRoute route;
  CustomButton({required this.buttonText, required this.route});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(240, 55)
        ),
          onPressed: (){
            Navigator.push(
              context,
              route,
            );
          },
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 22
            ),
          ),
      ),
    );
  }
}

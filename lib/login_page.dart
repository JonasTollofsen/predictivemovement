// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:predictivemovement/main.dart';
import 'bli_medlem.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MaterialApp(
        home: Scaffold(
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                    'assets/background.jpg',
                ),
              ),
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Image.asset(
                      'assets/Logo-vit-1.png',
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomInputField(
                                helpText: "Användarnamn",
                                passwordField: false
                            ),
                            CustomInputField(
                              helpText: "Lösenord",
                              passwordField: true,
                            ),
                          ],
                        ),
                      ),

                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
        ),
      ),
    );
  }
}






class CustomButton extends StatelessWidget {
  final String buttonText;
  final MaterialPageRoute route;
  const CustomButton({required this.buttonText, required this.route});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: (){
          Navigator.push(
            context, route,
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
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



class CustomInputField extends StatelessWidget {

  final String helpText;
  final bool passwordField;

  const CustomInputField({required this.helpText, required this.passwordField});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: TextFormField(
        obscureText: passwordField,
        style: TextStyle(
            color: Colors.white
        ),
        textAlign: TextAlign.center,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                width: 2
              )
            ),
            hintText: helpText,
          hintStyle: TextStyle(
              color: Colors.white
          ),
        ),
      ),
    );
  }
}

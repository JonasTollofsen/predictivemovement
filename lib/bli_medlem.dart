// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:predictivemovement/account.dart';
import 'package:predictivemovement/account_bank.dart';
import 'globals.dart' as globals;

class BliMedlem extends StatelessWidget {
  const BliMedlem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String username;
    String password;
    String name;
    return Scaffold(
      body: CustomForm(),
    );
  }
}

class CustomForm extends StatefulWidget {
  const CustomForm({Key? key}) : super(key: key);

  @override
  _CustomFormState createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  final username = TextEditingController();
  final password = TextEditingController();
  final name = TextEditingController();

  @override
  void dispose(){
    username.dispose();
    password.dispose();
    name.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          controller: username,
        ),

        TextField(
          controller: password,
        ),

        TextField(
          controller: name,
        ),

        ElevatedButton(
            onPressed: (){
              globals.accountBank.addAccount(Account(
                  username.text,
                  password.text,
                  name.text),
              );
            },
            child: Text(
                "bli medlem!"
            ),
        ),

        ElevatedButton(
            onPressed: (){
            },
            child: Text(
                "check dat account!",
            ),
        ),
      ],
    );

  }
}


import 'package:bytebank2/database/app_database.dart';
import 'package:bytebank2/models/contact.dart';
import 'package:bytebank2/screens/contact_form.dart';
import 'package:bytebank2/screens/contacts_list.dart';
import 'package:bytebank2/screens/dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BytebankApp());
    findAll().then((contacts) => debugPrint(contacts.toString()));
}

class BytebankApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.green[900],
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.blueAccent[700],
            textTheme: ButtonTextTheme.primary,
          ),
          colorScheme: ColorScheme.fromSwatch()
              .copyWith(secondary: Colors.blueAccent[700])),
      home: Dashboard(),
    );
  }
}

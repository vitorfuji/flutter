import 'package:flutter/material.dart';

import '../models/contact.dart';

class ContactForm extends StatefulWidget {
  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController accountNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Contact'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Full name'),
              style: const TextStyle(
                fontSize: 24.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TextField(
                controller: accountNumberController,
                decoration: InputDecoration(labelText: 'Account number'),
                style: const TextStyle(
                  fontSize: 24.0,
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  child: const Text('Create'),
                  onPressed: () {
                    final String name = nameController.text;
                    final int? accountNumber =
                        int.tryParse(accountNumberController.text);
                    final Contact newContact = Contact (0,name, accountNumber!);
                    Navigator.pop(context, newContact);
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

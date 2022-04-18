import 'package:flutter/material.dart';

import 'login_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(253, 80, 104, 1),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 200.0,
              width: 350.0,
              child: Image.asset('assets/logo.png'),
            ),
            const SizedBox(height: 15.0),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: ListTile(
                title: Center(
                  child: Text(
                    'Location Changer',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                subtitle: Center(
                  child: Text(
                    'Plugin app for Tinder',
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  fixedSize: const Size(250, 50),
                  onPrimary: const Color.fromRGBO(253, 80, 104, 1),
                  primary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  )),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              child: const Text(
                'Login with Facebook',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

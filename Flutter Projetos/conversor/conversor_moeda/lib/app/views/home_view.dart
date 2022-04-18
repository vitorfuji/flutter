import 'package:conversor_moeda/app/components/currency_box.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 100,
            bottom: 30.0,
            left: 30.0,
            right: 30.0,
          ),
          child: Column(
            children: [
              Image.asset(
                'assets/logo.png',
                width: 300.0,
                height: 300.0,
              ),
              const SizedBox(height: 30.0),
              const CurrencyBox(),
              const SizedBox(height: 10.0),
              const CurrencyBox(),
              const SizedBox(height: 50.0),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Converter'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.amber,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

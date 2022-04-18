import 'package:cripto_app/main.dart';
import 'package:cripto_app/provider/currency_provider.dart';
import 'package:cripto_app/widget/currency_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text(MyApp.title),
      centerTitle: true,
      backgroundColor: Colors.black,
    ),
    body: buildCurrencies(context),
  );

  Widget buildCurrencies(BuildContext context) {
    final provider = Provider.of<CurrencyProvider>(context);

    if (provider.hasError) {
      return const Center(child: Text('Something Went Wrong!'));
    } else if (provider.isLoading) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return const CurrenciesWidget();
    }
  }
}
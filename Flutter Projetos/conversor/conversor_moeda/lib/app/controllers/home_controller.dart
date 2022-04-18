import 'package:conversor_moeda/app/models/currency_model.dart';
import 'package:flutter/material.dart';

class HomeController {
  late List<CurrencyModel> currencies;

  TextEditingController toText = TextEditingController();
  TextEditingController fromText = TextEditingController();

  late CurrencyModel toCurrency;
  late CurrencyModel fromCurrency;

  HomeController() {
    currencies = CurrencyModel.getCurrencies();
    toCurrency = currencies[0];
    fromCurrency = currencies[1];
  }

  void convert() {
    String text = toText.text;
    double value = double.tryParse(text) ?? 1.0;
    double returnValue = 0;

    if (fromCurrency.nome == 'Real') {
      returnValue = value * toCurrency.real;
    } else if (fromCurrency.nome == 'Dolar') {
      returnValue = value * toCurrency.dolar;
    } else if (fromCurrency.nome == 'Euro') {
      returnValue = value * toCurrency.euro;
    } else if (fromCurrency.nome == 'Bitcoin') {
      returnValue = value * toCurrency.bitcoin;
    }

    fromText.text = returnValue.toStringAsFixed(2);
  }
}

import 'package:cripto_app/api/crypto_api.dart';
import 'package:cripto_app/model/moeda.dart';

import 'package:flutter/cupertino.dart';

import '../utils/currency_data_source.dart';

class CurrencyProvider extends ChangeNotifier {
  CurrencyDataSource? currencyDataSource;
  List<Currency> currencies = [];
  bool isLoading = false;
  bool hasError = false;

  CurrencyProvider() {
    loadCurrencies();
  }

  Future loadCurrencies() async {
    try {
      isLoading = true;
      notifyListeners();

      final currencies = await CryptoApi.getCurrencies();

      this.currencies = currencies;
      currencyDataSource = CurrencyDataSource(currencies: currencies);
      isLoading = false;
      notifyListeners();

      watchStream();
    } catch (e) {
      hasError = true;
      notifyListeners();
    }
  }

  void watchStream() => CryptoApi.getCurrenciesStream().listen((event) {
    currencies = event;
    currencyDataSource!.buildDataGrid(currencies);
    currencyDataSource!.updateDataGridSource();
  });
}
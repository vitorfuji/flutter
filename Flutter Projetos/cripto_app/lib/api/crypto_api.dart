import 'dart:convert';

import 'package:cripto_app/model/moeda.dart';
import 'package:http/http.dart' as http;

class CryptoApi {
  static const _key = '4fe49fbf4baf5a7b866ecbbc5622f468';

  static Stream<List<Currency>> getCurrenciesStream() =>
      Stream.periodic(const Duration(seconds: 10)).asyncMap((_) => getCurrencies());

  static Future<List<Currency>> getCurrencies() async {
    const url =
        'https://api.nomics.com/v1/currencies/ticker?key=$_key&interval=1d,1h&per-page=30&page=1';

    final response = await http.get(Uri.parse(url));
    final body = json.decode(response.body) as List;

    return body.map((item) => Currency.fromJson(item)).toList();
  }
}
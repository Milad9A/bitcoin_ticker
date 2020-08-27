import 'dart:convert';
import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];
const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = 'A47EF0E1-D17F-4B60-AFE4-E6A60BA04295';

class CoinData {
  Future<dynamic> getCoinData(String currency, String crypto) async {
    http.Response response =
        await http.get('$coinAPIURL/$crypto/$currency?apikey=$apiKey');
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}

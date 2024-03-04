import 'package:http/http.dart' as http;
import 'dart:convert';

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

const APIKEY = 'E3DF3C63-4945-4A80-80B1-3E945E9664A1';
const coinAPI = 'https://rest.coinapi.io/v1/exchangerate';

class CoinData {
  Future<dynamic> getCoinData(String selectedCurrency) async {
    Map<String, String> cryptomap = {};
    for (String crypto in cryptoList) {
      var uri = Uri.parse('$coinAPI/$crypto/$selectedCurrency?apikey=$APIKEY');
      http.Response response = await http.get(uri);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        double rate = data['rate'];
        cryptomap[crypto] = rate.toStringAsFixed(0);
      } else {
        print(response.statusCode);
      }
    }
    return cryptomap;
  }
}

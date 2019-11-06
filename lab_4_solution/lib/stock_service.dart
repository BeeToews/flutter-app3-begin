import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

const apiToken = 'Tpk_27e2aa9354b742e4aac4092f8d2b7f59';

class StockService {
  Future<double> getQuote(String symbol) async {
    String url =
        "https://sandbox.iexapis.com/stable/stock/${symbol}/quote/?token=$apiToken";
    http.Response response = await http.get(url);
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      var data = response.body;
      print(data);
      var decodedData = jsonDecode(data);
      var symbol = decodedData['symbol'];
      print(symbol);
      var companyName = decodedData['companyName'];
      print(companyName);
      var price = decodedData['latestPrice'];
      print(price);
    } else {
      print(response.statusCode);
    }
    return 3.00; //price;
  }
}

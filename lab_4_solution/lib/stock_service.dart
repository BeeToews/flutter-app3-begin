import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class StockService {
  Future<double> getPrice(String symbol) async {
    String url =
        "https://sandbox.iexapis.com/stable/stock/${symbol}/quote/?token=Tpk_27e2aa9354b742e4aac4092f8d2b7f59";
    http.Response response = await http.get(url);
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      var data = response.body;
      print(data);
      var symbol = jsonDecode(response.body)['symbol'];
      print(symbol);
      var companyName = jsonDecode(response.body)['companyName'];
      print(companyName);
      var price = jsonDecode(response.body)['latestPrice'];
      print(price);
    } else {
      print(response.statusCode);
    }
    return 3.00; //price;
  }
}

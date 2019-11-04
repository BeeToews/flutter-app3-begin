import 'package:http/http.dart' as http;
import 'dart:async';

class StockService {

  Future<double> getPrice(String symbol) async {
    //String url = "https://api.iextrading.com/1.0/stock/${symbol}/price";
    String url = "https://sandbox.iexapis.com/stable/stock/${symbol}/quote/latestPrice?token=Tpk_27e2aa9354b742e4aac4092f8d2b7f59";
    http.Response response = await http.get(url);
    print(response.statusCode);
    double price = double.tryParse(response.body);
    print(price);
    return price;
  }

}
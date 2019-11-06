import 'package:http/http.dart' as http;
import 'dart:async';

class StockService {
  Future<double> getPrice(String symbol) async {
    String url =
        "https://sandbox.iexapis.com/stable/stock/${symbol}/quote/?token=Tpk_27e2aa9354b742e4aac4092f8d2b7f59";
    http.Response response = await http.get(url);
    print(response.statusCode);
    print(response.body);
    //double price = double.tryParse(response.body);
    //print(price);
    return 3.00; //price;
  }
}

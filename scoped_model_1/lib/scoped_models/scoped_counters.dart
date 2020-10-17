import 'package:scoped_model/scoped_model.dart';
import '../models/counter.dart';

class MyScopedCounter extends Model {
  MyCounter counter1 = MyCounter();
  MyCounter counter2 = MyCounter();
  MyCounter counter3 = MyCounter();

  increment() {
    counter1.count += 1;
    counter2.count += 5;
    counter3.count += 10;

    notifyListeners();
  }
}

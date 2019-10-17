import 'package:scoped_model/scoped_model.dart';
import 'package:lab3/widget/DrinksCard.dart';
import 'package:lab3/model/DrinkType.dart';

class DrinksListModel extends Model {
  List<DrinkType> _drinkType = coffeeTypes;

  List<DrinkType> get drinkType => _drinkType;

  void updateDrinksList(List<DrinkType> type) {
    _drinkType = type;
    notifyListeners();
  }
}

import 'package:scoped_model/scoped_model.dart';
import 'package:flutter/material.dart';

class Number {
  final String title;
  final String image;
  Number(this.title, this.image);
}

List<Number> nums = <Number>[
  Number('Coffee', 'assets/img/1-1.jpg'),
  Number('Tea', 'assets/img/black-tea.jpeg'),
  //Number('Juice', 'assets/img/lemon.jpeg'),
  //Number('Smoothie', 'assets/img/apple-smoothie.jpeg'),
];

List<Number> coffeeTypes = <Number>[
  Number('Black Coffee', 'assets/img/black-coffee.jpeg'),
  Number('Cappuccino', 'assets/img/cappuccino.jpeg'),
  Number('Espresso', 'assets/img/espresso.jpeg'),
  Number('Latte', 'assets/img/latte.jpeg'),
];

List<Number> teaTypes = <Number>[
  Number('Black Tea', 'assets/img/black-tea.jpeg'),
  Number('Brown Tea', 'assets/img/brown-tea.jpeg'),
  Number('English Tea', 'assets/img/english-tea.jpeg'),
  Number('Herbal Tea', 'assets/img/herbal-tea.jpeg'),
  Number('Mint Tea', 'assets/img/mint-tea.jpeg'),
];

List<Number> juiceTypes = <Number>[
  Number('Lemon Juice', 'assets/img/lemon.jpeg'),
  Number('Lime Juice', 'assets/img/lime.jpeg'),
  Number('Pink Grape Juice', 'assets/img/pink-grape.jpeg'),
  Number('Plum Juice', 'assets/img/plum.jpeg'),
  Number('Tomato Juice', 'assets/img/tomato.jpeg'),
];

class MyModel extends Model {
  List<Number> _drinkType = coffeeTypes;

  List<Number> get drinkType => _drinkType;

  void updateDrinksList(List<Number> type) {
    _drinkType = type;
    notifyListeners();
  }
}

class DrinksCard extends StatelessWidget {
  final Number drinkType;

  const DrinksCard({Key key, this.drinkType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Center(
        child: Stack(
          children: <Widget>[
            Image.asset(
              drinkType.image,
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  drinkType.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DrinksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MyModel>(
      builder: (context, _, model) {
        return Expanded(
          child: GridView.count(
            crossAxisCount: 2,
            padding: EdgeInsets.all(6.0),
            children: model.drinkType.map((drinkType) {
              return DrinksCard(
                drinkType: drinkType,
              );
            }).toList(),
          ),
        );
      },
    );
  }
}

class DrinksCarousel extends StatefulWidget {
  @override
  _DrinksCarouselState createState() => _DrinksCarouselState();
}

class _DrinksCarouselState extends State<DrinksCarousel>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: nums.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  void _changeImage({int delta, bool userInput = false}) {
    var newTabIndex = _tabController.index + delta;
    if (newTabIndex >= coffeeTypes.length) {
      newTabIndex = 0;
    } else if (newTabIndex < 0) {
      newTabIndex = coffeeTypes.length - 1;
    }
    _tabController.animateTo(
      newTabIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.0,
      width: double.infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(
            width: 4.0,
            color: Colors.black,
          ),
        ),
        child: Stack(
          children: <Widget>[
            ScopedModelDescendant<MyModel>(
              rebuildOnChange: false,
              builder: (context, _, model) {
                return TabBarView(
                  controller: _tabController,
                  children: nums.map((drinkType) {
                    return GestureDetector(
                      onTap: () {
                        var type;
                        switch (drinkType.title) {
                          case 'Coffee':
                            type = coffeeTypes;
                            break;
                          case 'Tea':
                            type = teaTypes;
                            break;
                          default:
                            throw '${drinkType.title} type not recognized';
                        }
                        //_carouselTimer.cancel();
                        model.updateDrinksList(type);
                      },
                      child: DrinksCard(
                        drinkType: drinkType,
                      ),
                    );
                  }).toList(),
                );
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TabPageSelector(
                  controller: _tabController,
                  color: Colors.white,
                  indicatorSize: 20,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 36,
                ),
                onPressed: () {
                  _changeImage(delta: -1, userInput: true);
                },
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: Icon(
                  Icons.arrow_forward,
                  color: Colors.red,
                  size: 36,
                ),
                onPressed: () {
                  _changeImage(delta: 1, userInput: true);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyTabbedScopedModelApp1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab3 App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(title: 'Store Home'),
    );
  }
}

class HomePage extends StatelessWidget {
  final String title;

  const HomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedModel<MyModel>(
      model: MyModel(),
      child: Scaffold(
        backgroundColor: Colors.lightBlue,
        appBar: AppBar(
          title: Text(title),
        ),
        body: Column(
          children: <Widget>[
            DrinksCarousel(),
            DrinksList(),
          ],
        ),
      ),
    );
  }
}

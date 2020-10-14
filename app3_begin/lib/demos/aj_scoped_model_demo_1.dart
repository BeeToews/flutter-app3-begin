//This app demonstrates the use of the ScopedModel package
//that looks after the state management for the app.

//ScopedModel by whatsupcoders.
//https://www.youtube.com/watch?v=kpOT4OTzKLU

//scoped model by the flutter community.
//https://medium.com/@soonsantos/how-to-use-scopedmodel-in-flutter-f4178a728f99

import 'package:scoped_model/scoped_model.dart';
import 'package:flutter/material.dart';

class MyScopeModelApp1 extends StatelessWidget {
  const MyScopeModelApp1({@required this.myModel});

  final MyCounterModel myModel;

  @override
  Widget build(BuildContext context) {
    // At the top level of our app, we'll, create a ScopedModel Widget. This
    // will provide the MyCounterModel to all children in the app that request it
    // using a ScopedModelDescendant.
    return ScopedModel<MyCounterModel>(
      model: myModel,
      child: MaterialApp(
        title: 'Scoped Model Demo',
        home: CounterHome('Scoped Model Demo'),
      ),
    );
  }
}

// Start by creating a class that has a counter and a method to increment it.
//
// Note: It must inheirit from Model.
class MyCounterModel extends Model {
  //Private field.
  int _counter = 0;
  //Public property.
  int get counter => _counter;

  void increment() {
    //Increment the counter
    _counter++;

    //The notifyListeners method comes from the
    //base Model of the ScopedModel package.
    notifyListeners();
  }
}

class CounterHome extends StatelessWidget {
  final String title;

  CounterHome(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You have pushed the button this many times:'),
            // Create a ScopedModelDescendant. This widget will get the
            // CounterModel from the nearest parent ScopedModel<CounterModel>.
            // It will hand that CounterModel to our builder method, and
            // rebuild any time the MyCounterModel changes (i.e. after we
            // notifyListeners in the Model).
            ScopedModelDescendant<MyCounterModel>(
              builder: (context, child, model) {
                return Text(
                  model.counter.toString(),
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
          ],
        ),
      ),
      // Use the ScopedModelDescendant again in order to use the increment
      // method from the MyCounterModel
      floatingActionButton: ScopedModelDescendant<MyCounterModel>(
        builder: (context, child, model) {
          return FloatingActionButton(
            //Address of the model.increment method from the
            //MyCounterModel class.
            onPressed: model.increment,
            tooltip: 'Increment',
            child: Icon(Icons.add),
          );
        },
      ),
    );
  }
}

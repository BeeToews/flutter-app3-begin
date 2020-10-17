import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../../scoped_models/scoped_counters.dart';

class Widget2 extends StatelessWidget {
  @override
  Widget build(BuildContext ctext) {
    return ScopedModelDescendant<MyScopedCounter>(
        builder: (context, child, myModel) =>
            Text('Widget2 counter is ${myModel.counter2.count}'));
  }
}

import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../../scoped_models/scoped_counters.dart';

class Widget3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MyScopedCounter>(
        builder: (context, child, myModel) =>
            Text('Widget3 counter is ${myModel.counter3.count}'));
  }
}

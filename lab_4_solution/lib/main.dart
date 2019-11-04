import 'package:flutter/material.dart';
import 'package:lab3/widget/StoreHomePage.dart';

class Person {
  String firstName;
  String lastName;

  Person(this.firstName, this.lastName);
}

void main() {
  List<Person> people = new List<Person>();
  people.add(new Person("Joe", "Smithers"));
  people.add(new Person("Patrick", "Thomas"));
  for (var n in people) {
    print('Hey ${n.firstName} ${n.lastName}');
  }
  var mappedNames =
      people.map((n) => 'Mr. ${n.firstName} ${n.lastName}').toList();
  for (var x in mappedNames) {
    print(x);
  }

  runApp(MyAppLab3());
}

//void main() => runApp(MyAppLab3());

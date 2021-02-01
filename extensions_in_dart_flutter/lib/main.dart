// Extensions что это и зачем? Например, это расширение функционала (свойства, методы, операции) нашего класса в любом месте
// пример
// extension on String {
//   selfPrint() => print(this);
// }

import 'package:extensions_in_dart_flutter/car_service.dart';
import 'package:flutter/material.dart';
import 'package:extensions_in_dart_flutter/car_extension.dart'
    show
        CarExtension2; // если имеются конфликтующие extensin'ы то можно использовать hide и show

void main() => runApp(MyApp());

/*
  String a = 'Hello everybody';

  a.selfPrint(); // можно вызвать так 1
  'Hello Everybody'.selfPrint(); // а так же можно вызвать вот так 1

  print('aaaaaaaaaaa'.isLengthMore10); // 2

  ('Papa' & 'Mama').selfPrint(); // 3

  ('Papa' ^ 'Mama').toString().selfPrint(); // 4

  int x = 10.increase(); // 5
  double d = 10.0.increase(); // 5

  print('$x $d'); // 5

  print([1, 2, 3, 4, 5].sum); // 6
  print([1.2, 3.42, 5.423, 2.324].sum); // 6


extension <T extends num> on T { // можно работать с Generics 5
  T increase() => this + 1;
}

extension <T extends num> on List<T> { // можно работать с коллекциями + Generics 6
  T get sum { 
    num zero = 0;
    return this.fold(zero, (a, b) => a + b); // fold() складывает числа попарно 
  }
}

extension on String {
  selfPrint() => print(this); // 1

  bool get isLengthMore10 => this.length > 10; // 2

  String operator &(String other) => '$this $other'; // 3

  int operator ^(String other) => this.length + other.length; // 4
}
*/

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  bool login(String email, String password) {
    // functionality
    return true;
  }

  @override
  Widget build(BuildContext context) {
    var passwords = ['aaaaaa', 'bbbbb'];
    var email = 'email@email.com';
    passwords.forEach((password) => login(email, password));
    passwords.forEach(login.simplify(email));

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: CarService()
                .getCars()
                .map(
                  (car) => Text(
                    'Mileage: ${car.mileageInKm}, Age: ${car.age}',
                    style: TextStyle(fontSize: 20.0), // 7, 8
                  ).withPadding(),
                )
                .toList()),
      ),
    );
  }
}

extension<R, F, S> on R Function(F, S) {
  // extension's могут быть и для функций 9
  R Function(S) simplify(F first) {
    return (S second) => this(first, second);
  }
}

extension on Text {
  // extension'ы можно делать и для виджетов 7
  Widget withPadding() => Padding(padding: EdgeInsets.all(5.0), child: this);
}

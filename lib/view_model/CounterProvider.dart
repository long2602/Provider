import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int _counter = 0;
  int _counter2 = 0;

  int get counter => _counter;

  int get counter2 => _counter2;

  void increase() {
    _counter++;
    notifyListeners();
  }

  void decrease() {
    _counter--;
    notifyListeners();
  }

  void increase2() {
    _counter++;
    notifyListeners();
  }

  void decrease2() {
    _counter--;
    notifyListeners();
  }

  void restart() {
    _counter = 0;
    notifyListeners();
  }
}

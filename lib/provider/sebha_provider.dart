import 'package:azkar/shared_preferences.dart';
import 'package:flutter/material.dart';

class SebhaProvider with ChangeNotifier {
  late int counter;

  void getCounter() {
    counter = SharedPreferenceHelper.sharedPreferenceHelper.getCounter();
  }

  void incrementCounter() async {
    await SharedPreferenceHelper.sharedPreferenceHelper.setCounter(++counter);
    notifyListeners();
  }

  void reset() async {
    counter = 0;
    await SharedPreferenceHelper.sharedPreferenceHelper.setCounter(counter);
    notifyListeners();
  }
}

import 'package:azkar/Helper/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SebhaProvider with ChangeNotifier {
  int counter = SharedPreferenceHelper.sharedPreferenceHelper.getCounter();
  String zekrName = SharedPreferenceHelper.sharedPreferenceHelper.getZekrName();
  final titleController = TextEditingController();

  // void getCounter() async{
  //   counter = SharedPreferenceHelper.sharedPreferenceHelper.getCounter();
  // }

  void incrementCounter() async {
    await SharedPreferenceHelper.sharedPreferenceHelper.setCounter(++counter);
    notifyListeners();
  }

  void reset() async {
    counter = 0;
    await SharedPreferenceHelper.sharedPreferenceHelper.setCounter(counter);
    notifyListeners();
  }

  addZekrName(context) async {
    if (titleController.text.isEmpty) {
      Fluttertoast.showToast(
          msg: "أضف الذكر الخاص بك",
          toastLength: Toast.LENGTH_SHORT,
          backgroundColor: Colors.grey,
          textColor: Colors.black,
          fontSize: 17.sp);
    } else {
      zekrName = titleController.text.trim();
      await SharedPreferenceHelper.sharedPreferenceHelper.addZekrName(zekrName);
      Navigator.of(context).pop();
      titleController.clear();
      notifyListeners();
    }
  }
}

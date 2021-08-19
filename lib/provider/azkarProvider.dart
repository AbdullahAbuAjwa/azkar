import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AzkarProvider with ChangeNotifier {
  List _list = [];

  List get list {
    return [..._list];
  }

  set list(List value) {
    _list = value;
  }

  Stream<QuerySnapshot>? getAzkarHome() {
    return FirebaseFirestore.instance.collection('azkar').snapshots();
  }

  Future<void> addZekrCollection(name) async {
    CollectionReference azkar = FirebaseFirestore.instance.collection('azkar');
    try {
      await azkar.doc(name).set({
        'zekrName': name,
      });
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  Future getAzkarDetails(name) async {
    // return FirebaseFirestore.instance.collection('azkar').doc(name).get();

    try {
      await FirebaseFirestore.instance
          .collection("azkar")
          .doc(name)
          .get()
          .then((docSnapshot) {
        _list = docSnapshot.data()!['zakrList'];
        print(_list);
        notifyListeners();
      });
    } on Exception catch (e) {
      print('eeeee:' + e.toString());
    }
  }
}

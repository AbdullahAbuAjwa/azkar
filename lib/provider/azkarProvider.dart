import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AzkarProvider with ChangeNotifier {
  Stream<QuerySnapshot>? getAzkarHome() {
    return FirebaseFirestore.instance
        .collection('azkar')
        .orderBy("number", descending: false)
        .snapshots();
  }

  /*Future<void> addZekrCollection(context, TextEditingController name) async {
    CollectionReference azkar = FirebaseFirestore.instance.collection('azkar');
    Navigator.pop(context);

    try {
      await azkar.doc(name.text).set({
        'zekrName': name.text.trim(),
      }).then((value) => name.clear());
    } on Exception catch (e) {
      print('kkk' + e.toString());
    }
  }*/

  Stream<DocumentSnapshot<Map<String, dynamic>>> getAzkarDetails(name) {
    return FirebaseFirestore.instance.collection('azkar').doc(name).snapshots();
  }

/* Future<void> addZekr(context, docName, TextEditingController zekrName,
      TextEditingController repeat) async {
    CollectionReference zekr = FirebaseFirestore.instance.collection('azkar');
    Navigator.pop(context);
    try {
      await zekr.doc(docName).set(
        {
          'zakrList': FieldValue.arrayUnion([
            {
              'name': zekrName.text.trim(),
              'repeat': int.parse(repeat.text.trim())
            }
          ])
        },
        SetOptions(merge: true),
      );
      zekrName.clear();
      repeat.clear();
      print('Added');
      // getAzkarDetails(docName);
    } on Exception catch (e) {
      zekrName.clear();
      repeat.clear();
      print('Error: ' + e.toString());
    }
  }*/
}

import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreController {
  FireStoreController._();

  static FireStoreController firestoreConrtroller = FireStoreController._();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<List> getAzkar() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await firebaseFirestore
        .collection('azkar')
        .orderBy("number", descending: false)
        .get();
    final data = querySnapshot.docs.map((doc) => doc.data()).toList();
//    print(data);
    return data;
  }

  Future<Map<String, dynamic>?> getAzkarDetails(name) async {
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await firebaseFirestore.collection("azkar").doc(name).get();

    return documentSnapshot.data();
  }

  Future<String?> getDailyDoaa() async {
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await firebaseFirestore
            .collection("dayDoaa")
            .doc('5APRALjg9rLd07Fnadix')
            .get();

    return documentSnapshot.data()!['doaa'];
  }
}

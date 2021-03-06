import 'package:azkar/Helper/firestore_helper.dart';
import 'package:azkar/Pages/azkar_details_screen.dart';
import 'package:azkar/main.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class AzkarProvider with ChangeNotifier {
  List azkarCollectionList = [];
  Map<String, dynamic>? azkarDetails;
  String? doaa;

  getAzkarHome() async {
    azkarCollectionList =
        await FireStoreController.firestoreConrtroller.getAzkar();
    notifyListeners();
  }

  getAzkarDetails(name) async {
    azkarDetails = null;
    azkarDetails =
        await FireStoreController.firestoreConrtroller.getAzkarDetails(name);
    notifyListeners();
  }

  getDoaa() async {
    doaa = null;
    doaa = await FireStoreController.firestoreConrtroller.getDailyDoaa();
    notifyListeners();
  }

  Future<void> getNotification(context) async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channel.description,
                color: Colors.green,
                playSound: true,
                priority: Priority.defaultPriority,
                importance: Importance.defaultImportance,
                visibility: NotificationVisibility.public,
                icon: '@mipmap/ic_launcher',
                largeIcon: DrawableResourceAndroidBitmap('@mipmap/ic_launcher'),
              ),
            ));
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AzkarDetailsScreen(),
              settings: RouteSettings(
                arguments: notification.title,
              ),
            ));
      }
    });
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

  // Stream<DocumentSnapshot<Map<String, dynamic>>> getAzkarDetails(name) {
  //   return FirebaseFirestore.instance.collection('azkar').doc(name).snapshots();
  // }
}

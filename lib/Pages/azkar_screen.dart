import 'package:azkar/Widget/azkar_card.dart';
import 'package:azkar/Widget/dialog.dart';
import 'package:azkar/provider/azkarProvider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AzkarScreen extends StatefulWidget {
  @override
  _AzkarScreenState createState() => _AzkarScreenState();
}

class _AzkarScreenState extends State<AzkarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 8.w,vertical: 8.h),
        child: StreamBuilder<QuerySnapshot>(
          stream:
              Provider.of<AzkarProvider>(context, listen: false).getAzkarHome(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text('افحص الانترنت!'));
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            //todo
            return GridView.count(
              crossAxisCount: 3,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                return AzkarCard(
                  data['zekrName'],
                );
              }).toList(),
            );
          },
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     CustomDialog.customDialog.addZekrCollection(context);
      //   },
      //   child: Icon(Icons.add),
      // ),
    );
  }
}

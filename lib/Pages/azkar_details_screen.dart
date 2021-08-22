import 'package:azkar/Widget/azkar_details_card.dart';
import 'package:azkar/Widget/dialog.dart';
import 'package:azkar/provider/azkarProvider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AzkarDetailsScreen extends StatefulWidget {
  @override
  _AzkarDetailsScreenState createState() => _AzkarDetailsScreenState();
}

class _AzkarDetailsScreenState extends State<AzkarDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as String;

    return Hero(
      tag: arguments.toString(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(arguments.toString()),
          leading: Container(
            color: Theme.of(context).accentColor,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ),
        body: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
          stream: Provider.of<AzkarProvider>(context, listen: false)
              .getAzkarDetails(arguments),
          builder: (BuildContext context,
              AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text('لا يوجد أذكار'));
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            var azkarData = snapshot.data!.data();
            if (azkarData!['zakrList'] == null)
              return Center(child: Text('لا يوجد أذكار!'));
            return ListView.builder(
                itemCount: azkarData['zakrList'] != null
                    ? azkarData['zakrList'].length
                    : 0,
                itemBuilder: (BuildContext context, int index) {
                  return AzkarDetailsCard(
                    name: azkarData['zakrList'][index]['name'],
                    repeat: azkarData['zakrList'][index]['repeat'] ?? '-',
                  );
                });
          },
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     CustomDialog.customDialog.addZekr(context, arguments);
        //   },
        //   child: Icon(Icons.add),
        // ),
      ),
    );
  }
}

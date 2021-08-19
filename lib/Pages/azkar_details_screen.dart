import 'package:azkar/Widget/azkar_details_card.dart';
import 'package:azkar/provider/azkarProvider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AzkarDetailsScreen extends StatefulWidget {
  const AzkarDetailsScreen({Key? key}) : super(key: key);

  @override
  _AzkarDetailsScreenState createState() => _AzkarDetailsScreenState();
}

class _AzkarDetailsScreenState extends State<AzkarDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as String;
    // Provider.of<AzkarProvider>(context, listen: false)
    //     .getAzkarDetails(arguments);
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
        body: FutureBuilder(
          future: Provider.of<AzkarProvider>(context, listen: false)
              .getAzkarDetails(arguments),
          builder: (BuildContext context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text('لم يتم إضافة أذكار!'));
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            return Consumer<AzkarProvider>(builder: (context, provider, _) {
              if (provider.list.length == 0) {
                return Center(child: Text('لم يتم إضافة أذكار!'));
              }
              return ListView.builder(
                itemCount: provider.list.length,
                itemBuilder: (BuildContext context, int index) {
                  return AzkarDetailsCard(
                    provider.list[index]['name'],
                    provider.list[index]['repeat'],
                  );
                },
              );
            });
          },
        ),
      ),
    );
  }
}

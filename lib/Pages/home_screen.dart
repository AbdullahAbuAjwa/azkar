import 'package:azkar/Pages/sebha_screen.dart';
import 'package:azkar/Widget/azkar_card.dart';
import 'package:azkar/Widget/dialog.dart';
import 'package:azkar/provider/azkarProvider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('أذكاري'),
        actions: [
          IconButton(
              onPressed: () async {
                CustomDialog.customDialog.addZekrCollection(context);
              },
              icon: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    border: Border.all(color: Colors.black, width: 1.5)),
                child: Icon(
                  Icons.add,
                  color: Theme.of(context).primaryColor,
                ),
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
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
      floatingActionButton: sebhaFloating(),
    );
  }

  Widget sebhaFloating() {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SebhaScreen(),
          ),
        );
      },
      child: Image.asset(
        'assets/images/1.jpg',
        height: 120,
        width: 120,
        fit: BoxFit.fill,
      ),
      backgroundColor: Colors.white,
      tooltip: 'السبحة الالكترونية',
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      elevation: 0,
    );
  }
}

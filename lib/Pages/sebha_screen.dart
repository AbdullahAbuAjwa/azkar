
import 'package:flutter/material.dart';

class SebhaScreen extends StatefulWidget {
  const SebhaScreen({Key? key}) : super(key: key);

  @override
  _SebhaScreenState createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  int counter = 0;

  void increment() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('السبحة الالكترونية'),
        leading: Container(
          color: Theme.of(context).accentColor,
          child: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
      ),
      body: Center(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                increment();
              },
              child: Container(
                height: 170,
                width: 170,
                decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            SizedBox(height: 60),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(15.0),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'مجموع التسبيحات:',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    SizedBox(width: 20),
                    Text(
                      counter.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .headline3!
                          .copyWith(color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            TextButton(
                onPressed: () {
                  counter = 0;
                  setState(() {});
                },
                child: Text(
                  'تصفير',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

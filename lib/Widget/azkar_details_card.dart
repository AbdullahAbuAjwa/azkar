import 'package:flutter/material.dart';

class AzkarDetailsCard extends StatefulWidget {
  final name;
  var repeat;

  AzkarDetailsCard(this.name, this.repeat);

  @override
  _AzkarDetailsCardState createState() => _AzkarDetailsCardState();
}

class _AzkarDetailsCardState extends State<AzkarDetailsCard> {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.repeat != 0,

      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                widget.repeat--;
                setState(() {});
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: BorderSide(color: Colors.grey, width: 1.5),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    widget.name,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.greenAccent,
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Row(
                        children: [
                          Text(
                            'التكرار',
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(width: 10),
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child:
                                Center(child: Text(widget.repeat.toString())),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Row(
                        children: [
                          Text(
                            'مشاركة',
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(width: 10),
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                                child: Icon(
                              Icons.share,
                              size: 20,
                            )),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15),
            Divider(
              color: Colors.grey,
              thickness: 1,
              indent: 100,
              endIndent: 100,
            )
          ],
        ),
      ),
    );
  }
}

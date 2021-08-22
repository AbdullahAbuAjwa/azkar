import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                height: 185.h,
                width: 185.w,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green, width: 4.w),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    counter.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(color: Colors.red),
                  ),
                ),
              ),
            ),
            SizedBox(height: 60.h),
            TextButton(
                onPressed: () {
                  counter = 0;
                  setState(() {});
                },
                child: Text(
                  'تصفير',
                  style: TextStyle(
                    fontSize: 20.sp,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

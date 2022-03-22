import 'package:azkar/Widget/dialog.dart';
import 'package:azkar/provider/sebha_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SebhaScreen extends StatefulWidget {
  const SebhaScreen({Key? key}) : super(key: key);

  @override
  _SebhaScreenState createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<SebhaProvider>(builder: (context, provider, _) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  provider.incrementCounter();
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
                      provider.counter.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .headline3!
                          .copyWith(color: Colors.red),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40.h),
              GestureDetector(
                onTap: () {
                  CustomDialog.customDialog.addZekrInMasbaha(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'اسم الذكر: ',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 21.sp),
                    ),
                    Text(
                      provider.zekrName,
                      style: TextStyle(
                          color: Colors.green[700],
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15.h),
              TextButton(
                  onPressed: () {
                    provider.reset();
                  },
                  child: Text(
                    'تصفير',
                    style: TextStyle(
                      fontSize: 20.sp,
                      color: Colors.green[700],
                    ),
                  ))
            ],
          ),
        );
      }),
    );
  }
  //this is test branch
}

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
    // TODO: implement initState
    super.initState();
    Provider.of<SebhaProvider>(context, listen: false).getCounter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<SebhaProvider>(builder: (context, provider, _) {
        return Center(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
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
              SizedBox(height: 60.h),
              TextButton(
                  onPressed: () {
                    provider.reset();
                  },
                  child: Text(
                    'تصفير',
                    style: TextStyle(
                      fontSize: 20.sp,
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

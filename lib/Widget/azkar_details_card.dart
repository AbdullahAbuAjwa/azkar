import 'package:azkar/provider/azkarProvider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AzkarDetailsCard extends StatelessWidget {
  final name;
  var repeat;

  AzkarDetailsCard({this.name, this.repeat});

  @override
  Widget build(BuildContext context) {
    return Consumer<AzkarProvider>(builder: (context, provider, _) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.w),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.r),
                  side: BorderSide(color: Colors.grey, width: 1.5.w),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                  child: Text(
                    name.toString().replaceAll('\\n', '\n'),
                    textAlign: TextAlign.center,
                    style: GoogleFonts.amiri(fontSize: 18.sp),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.greenAccent,
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.w,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.r),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.h),
                      child: Row(
                        children: [
                          Text(
                            'التكرار',
                            style: TextStyle(fontSize: 18.sp),
                          ),
                          SizedBox(width: 10.w),
                          Container(
                            height: 30.h,
                            width: 30.w,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Center(child: Text(repeat.toString())),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 4.h),
                      child: Row(
                        children: [
                          Text(
                            'مشاركة',
                            style: TextStyle(fontSize: 18.sp),
                          ),
                          SizedBox(width: 10.w),
                          InkWell(
                            onTap: () {
                              Share.share(
                                  name.toString().replaceAll('\\n', '\n'));
                            },
                            child: Container(
                              height: 30.h,
                              width: 30.w,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                  child: Icon(
                                Icons.share,
                                size: 20.sp,
                              )),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15.h),
            Divider(
              color: Colors.grey,
              thickness: 1,
              indent: 100,
              endIndent: 100,
            )
          ],
        ),
      );
    });
  }
}

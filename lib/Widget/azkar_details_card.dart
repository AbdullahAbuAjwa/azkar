import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share/share.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AzkarDetailsCard extends StatefulWidget {
  final name;
  var repeat;

  AzkarDetailsCard({this.name, this.repeat});

  @override
  _AzkarDetailsCardState createState() => _AzkarDetailsCardState();
}

class _AzkarDetailsCardState extends State<AzkarDetailsCard> {
  bool visible = true;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 500),
        opacity: widget.repeat == 0 ? 0.0 : 1.0,
        onEnd: () {
          visible = false;
          setState(() {});
        },
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                child: GestureDetector(
                  onTap: () {
                    if (widget.repeat > 0) widget.repeat--;
                    setState(() {});
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.r),
                      side: BorderSide(color: Colors.grey, width: 1.5.w),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.h, horizontal: 10.w),
                      child: Text(
                        widget.name.toString().replaceAll('\\n', '\n'),
                        textAlign: TextAlign.center,
                        style: GoogleFonts.amiri(fontSize: 18.sp),
                      ),
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
                              child:
                              Center(child: Text(widget.repeat.toString())),
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
                                Share.share(widget.name
                                    .toString()
                                    .replaceAll('\\n', '\n'));
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
        ),
      ),
    );
  }
}

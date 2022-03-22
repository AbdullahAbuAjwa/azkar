import 'package:azkar/Widget/azkar_card.dart';
import 'package:azkar/provider/azkarProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AzkarScreen extends StatefulWidget {
  @override
  _AzkarScreenState createState() => _AzkarScreenState();
}

class _AzkarScreenState extends State<AzkarScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<AzkarProvider>(context, listen: false).getAzkarHome();
    Provider.of<AzkarProvider>(context, listen: false).getDoaa();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AzkarProvider>(builder: (context, provider, _) {
        if (provider.azkarCollectionList.isEmpty || provider.doaa == null) {
          return Center(child: CircularProgressIndicator());
        } else {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  width: 1.sw,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.black,
                        width: 1.2.w,
                      )),
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child:
                        Text(provider.doaa.toString().replaceAll('\\n', '\n'),
                            style: GoogleFonts.amiri(
                              color: Colors.green,
                              fontSize: 19.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemCount: provider.azkarCollectionList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return AzkarCard(
                          provider.azkarCollectionList[index]['zekrName']);
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3),
                  ),
                ),
              ),
            ],
          );
        }
      }),
    );
  }
}

import 'package:azkar/provider/sebha_provider.dart';
import 'package:flutter/material.dart';
import 'package:launch_review/launch_review.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDialog {
  CustomDialog._();

  static CustomDialog customDialog = CustomDialog._();
  final _repeatController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

/* Future<void> addZekrCollection(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'أضف نوع الذكر',
            style: TextStyle(fontSize: 20.sp),
          ),
          content: Form(
            key: _formKey,
            child: TextFormField(
              controller: _titleController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'الحقل فارغ!';
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: 'نوع الذكر',
              ),
            ),
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                TextButton(
                  child: Text(
                    'إلغاء',
                    style: TextStyle(color: Colors.red),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                    _titleController.clear();
                  },
                ),
                TextButton(
                  child: Text(
                    'إضافة',
                    style: TextStyle(color: Colors.blue),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await Provider.of<AzkarProvider>(context, listen: false)
                          .addZekrCollection(
                        context,
                        _titleController,
                      );
                    }
                    _titleController.clear();
                  },
                ),
              ],
            )
          ],
        );
      },
    );
  }*/

  /*Future<void> addZekr(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(
          child: SingleChildScrollView(
            child: AlertDialog(
              title: Text(
                'أضف الذكر',
                style: TextStyle(fontSize: 20.sp),
              ),
              content: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _titleController,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'الحقل فارغ!';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: 'الذكر',
                      ),
                    ),
                    TextFormField(
                      controller: _repeatController,
                      keyboardType: TextInputType.numberWithOptions(
                          signed: false, decimal: false),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'الحقل فارغ!';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: 'التكرار',
                      ),
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    TextButton(
                      child: Text(
                        'إلغاء',
                        style: TextStyle(color: Colors.red),
                      ),
                      onPressed: () {
                        _titleController.clear();
                        _repeatController.clear();
                        Navigator.of(context).pop();
                      },
                    ),
                    TextButton(
                      child: Text(
                        'إضافة',
                        style: TextStyle(color: Colors.blue),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          Navigator.of(context).pop();
                        }
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }*/

  Future<void> addZekrInMasbaha(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Consumer<SebhaProvider>(builder: (context, provider, _) {
          return AlertDialog(
            title: Text(
              'أضف الذكر',
              style: TextStyle(fontSize: 20.sp),
            ),
            content: TextFormField(
              controller: provider.titleController,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                hintText: 'الذكر',
              ),
            ),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    child: Text(
                      'إضافة',
                      style: TextStyle(color: Colors.blue),
                    ),
                    onPressed: () {
                      provider.addZekrName(context);
                    },
                  ),
                  TextButton(
                    child: Text(
                      'إلغاء',
                      style: TextStyle(color: Colors.red),
                    ),
                    onPressed: () async {
                      provider.titleController.clear();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              )
            ],
          );
        });
      },
    );
  }

  Future<void> rateApp(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Consumer<SebhaProvider>(builder: (context, provider, _) {
          return AlertDialog(
            title: Text(
              'تقييم التطبيق',
              style: TextStyle(fontSize: 20.sp),
            ),
            content: Text('هل ترغب بتقييم التطبيق؟'),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    child: Text(
                      'نعم',
                      style: TextStyle(color: Colors.blue),
                    ),
                    onPressed: () {
                      LaunchReview.launch(
                          androidAppId: "com.ajwa.azkar",
                          iOSAppId: "585027354");
                    },
                  ),
                  TextButton(
                    child: Text(
                      'لاحقا',
                      style: TextStyle(color: Colors.red),
                    ),
                    onPressed: () async {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              )
            ],
          );
        });
      },
    );
  }
}

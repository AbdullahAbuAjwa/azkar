import 'package:azkar/provider/azkarProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDialog {
  CustomDialog._();

  static CustomDialog customDialog = CustomDialog._();
  final _titleController = TextEditingController();
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

/*Future<void> addZekr(BuildContext context, docName) {
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
                          await Provider.of<AzkarProvider>(context,
                                  listen: false)
                              .addZekr(
                            context,
                            docName,
                            _titleController,
                            _repeatController,
                          );
                          _titleController.clear();
                          _repeatController.clear();
                          // Navigator.of(context).pop();
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
}

import 'package:azkar/provider/azkarProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomDialog {
  CustomDialog._();

  static CustomDialog customDialog = CustomDialog._();
  final _titleController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> addZekrCollection(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'أضف نوع الذكر',
            style: TextStyle(fontSize: 20),
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
                        _titleController.text.trim(),
                      );
                      _titleController.clear();
                      Navigator.of(context).pop();
                    }
                  },
                ),
              ],
            )
          ],
        );
      },
    );
  }
}

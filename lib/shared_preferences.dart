import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  SharedPreferenceHelper._();

  static SharedPreferenceHelper sharedPreferenceHelper =
      SharedPreferenceHelper._();

  SharedPreferences? sharedPreferences;

  initShredPreference() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  setCounter(counter) {
    sharedPreferences!.setInt('counter', counter);
  }

  int getCounter() {
    return sharedPreferences!.getInt('counter') ?? 0;
  }
}

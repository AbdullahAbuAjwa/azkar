import 'package:azkar/Pages/splash_screen.dart';
import 'package:azkar/provider/azkarProvider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(EasyLocalization(
    startLocale: Locale('ar'),
    path: 'assets/languages',
    supportedLocales: [Locale('ar'), Locale('en')],
    fallbackLocale: Locale('ar'),
    saveLocale: true,
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: AzkarProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'أذكاري',
        theme: ThemeData(
                primarySwatch: Colors.green, accentColor: Colors.greenAccent)
            .copyWith(
          appBarTheme: AppBarTheme(
              color: Colors.white,
              centerTitle: true,
              elevation: 0,
              textTheme: GoogleFonts.cairoTextTheme(TextTheme(
                headline6: TextStyle(
                  color: Colors.black,
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ))),
        ),
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        home: FutureBuilder(
          future: _initialization,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print('error');
              return Container(
                color: Colors.white,
              );
            }
            if (snapshot.connectionState == ConnectionState.done) {
              return SplashScreen();
            }
            return Container(color: Colors.white);
          },
        ),
      ),
    );
  }
}

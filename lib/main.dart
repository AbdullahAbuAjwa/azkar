import 'package:azkar/Pages/splash_screen.dart';
import 'package:azkar/provider/azkarProvider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'azkar_channel', // id
    'Azkar Notifications', // title
    'This channel is used for Azkar notifications.', // description
    importance: Importance.high,
    playSound: true);
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('A bg message just showed up :  ${message.messageId}');
}

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,

  );
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
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: AzkarProvider()),
      ],
      child: ScreenUtilInit(
        designSize: Size(411.42857142857144, 683.4285714285714),
        builder: () => MaterialApp(
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
                    fontSize: 23.sp,
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
      ),
    );
  }
}

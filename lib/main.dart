import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'View/splash_screen.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // initialise app based on platform- web or mobile
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyCUKLAyzuRT846Wj2wK6xA8gIcKxO3mk4g",
          appId: "1:182709917285:web:9a5b72a7ead36f9d41988c",
          messagingSenderId: "182709917285",
          projectId: "goodtimes-fashion",
          storageBucket: 'goodtimes-fashion.appspot.com'),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GoodTimes_trendz',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      getPages: [
        GetPage(name: '/', page: () => const SplashScreen()),
      ],
      initialRoute: '/',
    );
  }
}

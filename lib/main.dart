import 'package:ICTC_Website/pages/about.dart';
import 'package:ICTC_Website/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Ateneo ICTC',
        theme: ThemeData(
          fontFamily: "Montserrat",
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xff153faa),
              onPrimary: const Color(0xff153faa),
              onSecondary: Colors.white,
              onPrimaryContainer: const Color(0xff153faa),
              onSecondaryContainer: Colors.white),
          textTheme: TextTheme(
            displayLarge: TextStyle(
                fontSize: 64, fontWeight: FontWeight.w800, color: Colors.white),
            titleLarge: TextStyle(
                fontSize: 64,
                fontWeight: FontWeight.w800,
                color: Color(0xffF9CE69)),
            displayMedium: TextStyle(fontSize: 40, fontWeight: FontWeight.w400),
            labelSmall: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w300, color: Colors.white),
          ),
          useMaterial3: true,
        ),
        routes: {
          '/home': (context) => const HomePage(),
          '/about': (context) => const AboutPage(),
        },
        home: const MainApp());
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(backgroundColor: Colors.white, body: HomePage());
  }
}

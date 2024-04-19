import 'package:ICTC_Website/pages/auth/login_page.dart';
import 'package:ICTC_Website/pages/auth/signup_page.dart';
import 'package:ICTC_Website/pages/desktop/about.dart';
import 'package:ICTC_Website/pages/desktop/home.dart';
import 'package:ICTC_Website/pages/mobile/home.dart';
import 'package:ICTC_Website/pages/programs/google_certified_educators.dart';
import 'package:ICTC_Website/pages/programs/microcredentials.dart';
import 'package:ICTC_Website/pages/programs/skillup.dart';
import 'package:ICTC_Website/supabase_options.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: SupabaseOptions.SUPABASE_URL,
    anonKey: SupabaseOptions.SUPABASE_ANON_KEY,
    debug: true,
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
            labelMedium: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w300, color: Colors.white),
            displayMedium: TextStyle(
                fontSize: 40, fontWeight: FontWeight.w800, color: Colors.white),
            titleMedium: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w800,
                color: Color(0xffF9CE69)),
            labelSmall: TextStyle(
                fontSize: 12, fontWeight: FontWeight.w300, color: Colors.white),
            bodyLarge: TextStyle(
                fontSize: 64,
                fontWeight: FontWeight.w600,
                color: Color(0xff153faa)),
            bodyMedium: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black),
          ),
          useMaterial3: true,
        ),
        // routes: {
        //   '/home': (context) => const HomeDesktopPage(),
        //   '/signup': (context) => const SignupPage(),
        //   '/login': (context) => const LoginPage(),
        //   '/about': (context) => const AboutPage(),
        //   '/microcredentials': (context) => const MicrocredentialsPage(),
        //   '/skillup': (context) => const SkillUpPage(),
        //   '/google_certified_educators': (context) =>
        //       const GoogleCertifiedEducatorsPage(),
        // },
        home: const MainApp());
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      desktop: (BuildContext context) => HomeDesktopPage(),
      mobile: (BuildContext context) => HomeMobilePage(),
      // tablet: (BuildContext context) => Container(color:Colors.yellow),
      // watch: (BuildContext context) => Container(color:Colors.purple),
    );
  }
}

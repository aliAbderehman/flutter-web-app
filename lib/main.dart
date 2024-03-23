import 'package:dmd_web_01/about_us.dart';
import 'package:dmd_web_01/contact_us.dart';
import 'package:dmd_web_01/home.dart';
import 'package:dmd_web_01/our_works.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:dmd_web_01/theme/theme.dart';
import 'package:dmd_web_01/theme/theme_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, provider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'DMD',
          theme: lightMode,
          darkTheme: darkMode,
          themeMode: provider.themeMode,
          // home: const ContactUs(),
          initialRoute: '/',
          routes: {
            '/': (context) => const MyHomePage(),
            '/about': (context) => const AboutUsPage(),
            '/contact_us_page': (context) => const ContactUs(),
            '/our_work_page': (context) => const OurWorks(),
          },
        );
      },
    );
  }
}

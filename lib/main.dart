import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uhh/contact_us_page.dart';
import 'package:uhh/platform/abouts.dart';
import 'package:uhh/platform/contact_us.dart';
import 'package:uhh/platform/our_works.dart';
import 'package:uhh/theme/theme.dart';
import 'package:uhh/theme/theme_provider.dart';

import 'my_home_page.dart';

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
          title: 'Flutter Demo',
          theme: lightMode,
          darkTheme: darkMode,
          themeMode: provider.themeMode,
          // home: const ContactUs(),
          initialRoute: '/',
          routes: {
            '/': (context) => const MyHomePage(),
            '/about': (context) => const Abouts(),
            '/contact_us_page': (context) => const ContactUs(),

            // '/mobile_contact_us_page': (context) => const MobileContactUs(),
            '/our_work_page': (context) => const OurWorks(),

            // '/contact_us': (context) => const ContactUs(),
          },
        );
      },
    );
  }
}

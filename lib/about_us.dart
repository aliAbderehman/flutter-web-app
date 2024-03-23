import 'package:dmd_web_01/platform/desktop/abouts.dart';
import 'package:dmd_web_01/platform/mobile/about_us_mobile.dart';
import 'package:flutter/material.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key});

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 760;
  bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 760;
  @override
  Widget build(BuildContext context) {
    if (isDesktop(context)) {
      return const Abouts();
    } else {
      return const AboutUsMobile();
    }
  }
}

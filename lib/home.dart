import 'package:flutter/material.dart';
import 'package:dmd_web_01/platform/desktop/desktop.dart';
import 'package:dmd_web_01/platform/mobile/mobile.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 760;
  bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 760;
  @override
  Widget build(BuildContext context) {
    if (isDesktop(context)) {
      return const DesktopBody();
    } else {
      return const MobileBody();
    }
  }
}

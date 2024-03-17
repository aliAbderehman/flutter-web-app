import 'package:flutter/material.dart';
import 'package:uhh/platform/desktop/desktop.dart';
import 'package:uhh/platform/mobile/mobile.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 500;
  bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 500;
  @override
  Widget build(BuildContext context) {
    if (isDesktop(context)) {
      return const DesktopBody();
    } else {
      return const MobileBody();
    }
  }
}

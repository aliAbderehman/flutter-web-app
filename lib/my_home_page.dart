import 'package:flutter/material.dart';
import 'package:uhh/platform/desktop.dart';
import 'package:uhh/platform/mobile.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 665;
  bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 665;
  @override
  Widget build(BuildContext context) {
    if (isDesktop(context)) {
      return DesktopBody();
    } else {
      return MobileBody();
    }
  }
}

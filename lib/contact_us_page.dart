import 'package:flutter/material.dart';
import 'package:uhh/platform/contact_us.dart';
import 'package:uhh/platform/mobile_contact_us.dart';

class ContactUsPage extends StatefulWidget {
  const ContactUsPage({super.key});

  @override
  State<ContactUsPage> createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 665;
  bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 665;
  @override
  Widget build(BuildContext context) {
    if (isDesktop(context)) {
      return const ContactUs();
    } else {
      return const MobileContactUs();
    }
  }
}

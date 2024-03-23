import 'package:dmd_web_01/platform/desktop/contact_us_desktop.dart';
import 'package:dmd_web_01/platform/mobile/contact_us_mobile.dart';
import 'package:flutter/cupertino.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 760;
  bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 760;
  @override
  Widget build(BuildContext context) {
    if (isDesktop(context)) {
      return const ContactUsDesktop();
    } else {
      return const ContactUsMobile();
    }
  }
}

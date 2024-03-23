import 'package:dmd_web_01/platform/desktop/our_works_desktop.dart';
import 'package:dmd_web_01/platform/mobile/our_works_mobile.dart';
import 'package:flutter/cupertino.dart';

class OurWorks extends StatefulWidget {
  const OurWorks({super.key});

  @override
  State<OurWorks> createState() => _OurWorksState();
}

class _OurWorksState extends State<OurWorks> {
  bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 760;
  bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 760;
  @override
  Widget build(BuildContext context) {
    if (isDesktop(context)) {
      return const OurWorksDesktop();
    } else {
      return const OurWorksMobile();
    }
  }
}

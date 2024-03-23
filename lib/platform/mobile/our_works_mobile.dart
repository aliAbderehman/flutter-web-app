import 'package:dmd_web_01/constants.dart';
import 'package:dmd_web_01/costom_materials/footer.dart';
import 'package:dmd_web_01/costom_materials/mobile_menu.dart';
import 'package:flutter/material.dart';

class OurWorksMobile extends StatefulWidget {
  const OurWorksMobile({super.key});

  @override
  State<OurWorksMobile> createState() => _OurWorksMobileState();
}

class _OurWorksMobileState extends State<OurWorksMobile>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      extendBodyBehindAppBar: true,
      onEndDrawerChanged: (isOpened) {
        if (!isOpened) {
          _controller.reverse();
        }
      },
      endDrawer: screenWidth < 760
          ? CustomEndDrawer(
              screenWidth: screenWidth,
            )
          : null,
      appBar: screenWidth < 760 ? CustomAppBar(controller: _controller) : null,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        isDarkTheme(context)
                            ? 'assets/images/materials/bg_002.png'
                            : 'assets/images/materials/blue_bg_002.png',
                      ))),
              height: 230,
              width: double.infinity,
              child: const SelectableText(
                'Our Works',
                style: TextStyle(fontFamily: 'Metropolis', color: Colors.white),
              ),
            ),
            const TxtWithTitle(
                content:
                    'At $companyNameShort, we take pride in our diverse portfolio of projects and initiatives that showcase our commitment to excellence, innovation, and customer satisfaction. From supplying cutting-edge IT solutions to delivering premium coffee blends, our works reflect our dedication to meeting the needs of our clients and partners across various industries'),
            ListBody(
              children: ourWorksTxt.map((e) {
                return TxtWithTitle(
                  content: e.content,
                  title: '${e.title}: ',
                  imgPath: e.imgPath,
                );
              }).toList(),
            ),
            const SelectableText('Our Commitment'),
            const TxtWithTitle(
                content:
                    'At $companyNameShort, our works are more than just transactions—they\'re a testament to our values, integrity, and passion for excellence. Whether it\'s supplying essential equipment, enhancing everyday living, or building lasting partnerships, we approach every project with dedication, professionalism, and a commitment to exceeding expectations.'),
            const SmallMobileSizeFooter(),
          ],
        ),
      ),
    );
  }
}

class TxtWithTitle extends StatelessWidget {
  const TxtWithTitle({
    super.key,
    this.title,
    required this.content,
    this.imgPath,
  });
  final String? title;
  final String content;
  final String? imgPath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 20),
      child: SelectableText.rich(
        TextSpan(
            text: title ?? '',
            style: TextStyle(
                fontSize: 14,
                fontFamily: 'Metropolis',
                color: Theme.of(context).colorScheme.tertiary),
            children: [
              TextSpan(
                text: '$content\n',
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'MetropolisReg',
                    color: isDarkTheme(context)
                        ? const Color(0xffb9ccd0)
                        : const Color(0xff114052)),
              ),
              if (imgPath != null)
                WidgetSpan(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Image(
                        height: 200,
                        image: AssetImage(imgPath!),
                      ),
                    ),
                  ),
                )
            ]),
      ),
    );
  }
}
